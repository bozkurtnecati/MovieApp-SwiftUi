//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Necati Bozkurt on 31.10.2022.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var id : Int
    
    @StateObject var fetcher = MovieDetailFetcher()
    
    var body: some View {
        VStack {
            ScrollView {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(fetcher.movie?.backdropPath ?? "")")) { image in
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
                        Text(fetcher.movie?.title ?? "")
                            .font(.title2)
                            .fontWeight(.bold)
                     
                        Spacer()
                        HStack {
                            Text("TMDB")
                                .fontWeight(.bold)
                            Text(String(fetcher.movie?.voteAverage ?? 0.0).prefix(3))
                                .fontWeight(.bold)
                        }
                        .shadow(color: .black, radius: 20)
                        .padding(5)
                        .foregroundColor(.white)
                        .background(Color.yellow)
                        .cornerRadius(4)
                    }

                    HStack {
                        ForEach(fetcher.movie?.genres ?? []) { item in
                            Text(item.name ?? "")
                                .font(.callout)
                        }
                    }

                    HStack {
                        Text(fetcher.movie?.releaseDate?.dropLast(6) ?? "")
                        Text("-")
                        Text("\(fetcher.movie?.runtime ?? 0) min")
                        Text("-")
                        Text("$\(fetcher.movie?.budget ?? 0)")
                    }
                    .font(.callout)

                    Divider()
                    Text(fetcher.movie?.overview ?? "")
                    Divider()
    
                }
                .padding()
            }
            
            
        }
        .onAppear { fetcher.fetchDetail(movieId: id) }
        .navigationTitle(fetcher.movie?.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(id: 718930)
    }
}
