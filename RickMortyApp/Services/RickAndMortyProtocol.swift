import Foundation
import Combine

protocol RickAndMortyService {
    func getAllLocations () -> AnyPublisher<Location,Error>
}
