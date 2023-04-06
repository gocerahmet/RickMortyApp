//  Rick and Morty App for Invio Challenge
//  Ahmet Gocer 

import Foundation

enum LocationViewModelState {
case initial
case loading
case loaded(locations:Location)
case error(errorMessage:String)
    
}

struct Location: Decodable {
    let info: Info
    let results: [Result]
}

struct Info: Codable {
    let count:Int//": 826,
    let pages:Int//": 42,
    let next:String//": "https://rickandmortyapi.com/api/character?page=2",
    let prev:String?//": null
}

struct Result: Identifiable,Codable  {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
