//
//  SeriesDetailView.swift
//  MovieApp
//
//  Created by Necati Bozkurt on 2.11.2022.
//

import SwiftUI

struct SeriesDetailView: View {
        var id : Int
        
        @StateObject var fetcher = SeriesDetailFetcher()
        
        var body: some View {
            VStack {
                ScrollView {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(fetcher.series?.backdropPath ?? "")")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 230)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 221)
                            .foregroundColor(Color.white)
                            .background(Color.secondary)
                           
                    }
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        HStack {
                            Text(fetcher.series?.name ?? "")
                                .font(.title2)
                                .fontWeight(.bold)
                         
                            Spacer()
                            HStack {
                                Text("TMDB")
                                    .fontWeight(.bold)
                                Text(String(fetcher.series?.voteAverage ?? 0.0).prefix(3))
                                    .fontWeight(.bold)
                            }
                            .shadow(color: .black, radius: 20)
                            .padding(5)
                            .foregroundColor(.white)
                            .background(Color.yellow)
                            .cornerRadius(4)
                        }

                        HStack {
                            ForEach(fetcher.series?.genres ?? []) { item in
                                Text(item.name ?? "")
                                    .font(.callout)
                            }
                        }

                        HStack {
                            Text(fetcher.series?.firstAirDate?.dropLast(6) ?? "")
                            Text("-")
                            Text("Season \(fetcher.series?.numberOfSeasons ?? 0)")
                            Text("-")
                            Text("Episode \(fetcher.series?.numberOfEpisodes ?? 0)")
                        }
                        .font(.callout)

                        Divider()
                        Text(fetcher.series?.overview ?? "")
                        Divider()
                        
        
                    }
                    .padding()
                }
                
                
            }
            .onAppear { fetcher.fetchDetail(seriesId: id) }
            .navigationTitle(fetcher.series?.name ?? "")
            .navigationBarTitleDisplayMode(.inline)
            
        }

}

struct SeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesDetailView(id: 95403)
    }
}
