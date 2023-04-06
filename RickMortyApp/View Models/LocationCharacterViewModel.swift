import Foundation

class LocationCharacterViewModel: ObservableObject {
    @Published var characters: [LocationCharacter] = []
    @Published var karakterDizi: String = "" //karakterDizisini burada tanımlıyoruz.
 
    //ID'lere göre karakter çeken fonksiyon
    func fetchCharacters(ids: String) {
        let idArray = ids.components(separatedBy: ",")
        for id in idArray {
            guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else {
                fatalError("Invalid URL")
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let character = try? JSONDecoder().decode(LocationCharacter.self, from: data) {
                        DispatchQueue.main.async {
                            self.characters.append(character)
                        }
                    }
                }
            }.resume()
        }
    }

}
