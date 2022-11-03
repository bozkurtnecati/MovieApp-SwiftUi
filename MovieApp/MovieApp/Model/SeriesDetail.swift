import Foundation

// MARK: - Welcome
struct SeriesDetail: Codable {
    let backdropPath: String?
    let firstAirDate: String?
    let genres: [Genre]?
    let id: Int?
    let name: String?
    let numberOfEpisodes, numberOfSeasons: Int?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genres, id
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
