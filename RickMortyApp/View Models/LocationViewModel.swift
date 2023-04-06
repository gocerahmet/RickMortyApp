import Foundation
import Combine

class LocationViewModel : ObservableObject {
    
    @Published var locationsState:LocationViewModelState=LocationViewModelState.initial
    
    let rickAndMoortyDataService:RickAndMortyDataServices=RickAndMortyDataServices()
    var cancellable = Set<AnyCancellable>()
    
    
    init() {
        getAllLocations()
    }
    
    func getAllLocations(){
        locationsState=LocationViewModelState.loading
        rickAndMoortyDataService.getAllLocations()
            .sink { [weak self] completion in
                switch completion{
                    
                case .finished:
                    print("finish")
                case .failure(let error):
                    self?.locationsState=LocationViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] Location in
                self?.locationsState=LocationViewModelState.loaded(locations: Location)
            }
            .store(in: &cancellable)
    }
    
}
