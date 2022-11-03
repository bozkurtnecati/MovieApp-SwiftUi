//
//  SeriesView.swift
//  MovieApp
//
//  Created by Necati Bozkurt on 2.11.2022.
//

import SwiftUI

struct SeriesView: View {
    @StateObject var fetcher = MovieFetcher()
    @State var timeWindow = false
    
    var body: some View {
        NavigationView {
            List(fetcher.movies?.results ?? []) { item in
                VStack {
                    NavigationLink {
                        VStack{
                            SeriesDetailView(id: item.id ?? 1396)
                        }
                        
                    } label: {
                        HStack(alignment: .center) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(item.poster_path ?? "")")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50.0, height: 80.0)
                            } placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50.0, height: 80.0)
                                    .foregroundColor(Color.secondary)
                            }
                            VStack(alignment: .leading) {
                                Text(item.name ?? "error title")
                                    .lineLimit(1)
                                    .font(.headline)
                                Text(item.firstAirDate?.dropLast(6) ?? "error date")
                                    .font(.subheadline)
                                Text(item.overview ?? "error overview")
                                    .lineLimit(2)
                            }
                            
                        }
                    }
                }
            }
            .onAppear { fetcher.fetchMovie(media: .tv , time: .week) }
            .navigationTitle("\(timeWindow ? "Daily" : "Weekly") Trendings")
            .navigationBarItems(trailing:
                Button{
                    timeWindow.toggle()
                    fetcher.fetchMovie(media: .tv, time: timeWindow ? .day : .week)
                }
                label:{
                    Text("\(timeWindow ? "Weekly" : "Daily")")
                }
            )

        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView()
    }
}
