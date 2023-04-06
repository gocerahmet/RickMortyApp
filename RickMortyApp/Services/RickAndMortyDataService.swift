import Foundation
import Combine

class RickAndMortyDataServices: RickAndMortyService{
    func getAllLocations() -> AnyPublisher<Location, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/location")!)
            .map({$0.data})
            .decode(type: Location.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
