/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Results : Codable, Identifiable {
	let adult : Bool?
	let backdrop_path : String?
	let id : Int?
	let title : String?
    let name : String?
	let original_language : String?
	let original_title : String?
	let overview : String?
	let poster_path : String?
	let media_type : String?
	let genre_ids : [Int]?
	let popularity : Double?
	let release_date : String?
    let firstAirDate : String?
	let video : Bool?
	let vote_average : Double?
	let vote_count : Int?
    

	enum CodingKeys: String, CodingKey {

		case adult = "adult"
		case backdrop_path = "backdrop_path"
		case id = "id"
		case title = "title"
        case name = "name"
		case original_language = "original_language"
		case original_title = "original_title"
		case overview = "overview"
		case poster_path = "poster_path"
		case media_type = "media_type"
		case genre_ids = "genre_ids"
		case popularity = "popularity"
		case release_date = "release_date"
        case firstAirDate = "first_air_date"
		case video = "video"
		case vote_average = "vote_average"
		case vote_count = "vote_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
		backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
        name = try values.decodeIfPresent(String.self, forKey: .name)
		original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
		original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
		media_type = try values.decodeIfPresent(String.self, forKey: .media_type)
		genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
		release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        firstAirDate = try values.decodeIfPresent(String.self, forKey: .firstAirDate)
		video = try values.decodeIfPresent(Bool.self, forKey: .video)
		vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
		vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
	}

}
