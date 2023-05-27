//
//  Character.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 19/05/23.
//

import Foundation

struct Character: Decodable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var image: String?
    var origin: Origin?
    var location: Location?
    var episode: [String]?
}
