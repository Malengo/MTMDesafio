//
//  Episode.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 23/05/23.
//

import Foundation

struct Episode: Decodable {
    var name: String?
    var air_date: String?
    var episode: String?
    var characters: [String]?
}
