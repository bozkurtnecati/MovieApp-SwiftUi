//
//  SearchView.swift
//  MovieApp
//
//  Created by Necati Bozkurt on 3.11.2022.
//

import SwiftUI

struct SearchView: View {
    @StateObject var fetcher = SearchFetcher()
    @State var search = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search movies or series", text: $search , onCommit: {
                    self.fetcher.fetchSearch(search: search.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? search)
                })
                .textFieldStyle(.roundedBorder)
                .padding()
                
                List(fetcher.search?.results ?? []) { item in
                    VStack {
                        NavigationLink {
                            VStack{
                                if item.media_type == "movie" {
                                    MovieDetailsView(id: item.id ?? 550)
                                }else {
                                    SeriesDetailView(id: item.id ?? 1396)
                                }
                                
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
                                    if item.media_type == "tv" {
                                        Text(item.name ?? "error title")
                                            .lineLimit(1)
                                            .font(.headline)
                                    }else {
                                        Text(item.title ?? "error title")
                                            .lineLimit(1)
                                            .font(.headline)
                                    }
                                    if item.release_date != nil  {
                                        Text(item.release_date?.dropLast(6) ?? "error date")
                                            .font(.subheadline)
                                    }else{
                                        Text(item.firstAirDate?.dropLast(6) ?? "error date")
                                            .font(.subheadline)
                                    }
                                    Text(item.overview ?? "error overview")
                                        .lineLimit(2)
                                }
                                
                            }
                        }
                    }
                }
                
                
            }
            .navigationTitle("Search")
        }
       
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

