//  Rick and Morty App for Invio Challenge
//  Ahmet Gocer 

import Foundation

struct LocationCharacter: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: SingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct SingleLocation:Codable {
    let name: String
    let url: String
}
