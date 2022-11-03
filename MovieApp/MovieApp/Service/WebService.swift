//
//  WebService.swift
//  MovieApp
//
//  Created by Necati Bozkurt on 6.10.2022.
//

import Foundation

class MovieFetcher: ObservableObject {
    
    @Published var movies : Base?
    
    func fetchMovie(media: mediaType, time: timeWindow) {
        let url = URL(string: "https://api.themoviedb.org/3/trending/\(media)/\(time)?api_key=TMDBAPIKEY")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                let decodedList = try? JSONDecoder().decode(Base.self, from: data)
                DispatchQueue.main.async {
                    self.movies = decodedList
                }
            } else {
                print("No Data")
            }
        }.resume()
    }
}

enum mediaType: String {
    case all
    case movie
    case tv
    case person
}

enum timeWindow: String {
    case week
    case day
}



class MovieDetailFetcher: ObservableObject {

    @Published var movie : MovieDetail?

    func fetchDetail(movieId: Int) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(String(movieId))?api_key=TMDBAPIKEY")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                let decodedList = try? JSONDecoder().decode(MovieDetail.self, from: data)
                DispatchQueue.main.async {
                    self.movie = decodedList
                }
            } else {
                print("No Data")
            }
        }.resume()
    }
}


class SeriesDetailFetcher: ObservableObject {

    @Published var series : SeriesDetail?

    func fetchDetail(seriesId: Int) {
        let url = URL(string: "https://api.themoviedb.org/3/tv/\(String(seriesId))?api_key=TMDBAPIKEY")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                let decodedList = try? JSONDecoder().decode(SeriesDetail.self, from: data)
                DispatchQueue.main.async {
                    self.series = decodedList
                }
            } else {
                print("No Data")
            }
        }.resume()
    }
}



class SearchFetcher: ObservableObject {

    @Published var search : Base?

    func fetchSearch(search: String) {
        let url = URL(string: "https://api.themoviedb.org/3/search/multi?api_key=TMDBAPIKEY&language=en-US&query=\(search)")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                let decodedList = try? JSONDecoder().decode(Base.self, from: data)
                DispatchQueue.main.async {
                    self.search = decodedList
                }
            } else {
                print("No Data")
            }
        }.resume()
    }
}

