//  LocationView.swift
//  Rick and Morty App
//  Ahmet Gocer

import SwiftUI


// Butona basıldığında renk değiştirmesini sağlayan fonksiyon

struct HighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.red : Color.yellow)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}



struct LocationView: View {

    @StateObject private var viewModel: LocationViewModel = LocationViewModel()
    @State private var selectedLocation: String? = nil
    @ObservedObject var viewModel2 = LocationCharacterViewModel()
    
    
    var body: some View {
        
        VStack {
      //Lokasyonları yazdırıyoruz.
            switch viewModel.locationsState {
            case .initial, .loading:
                ProgressView()
            case .error(let error):
                Text(error)
            case .loaded(let data):
                
                ScrollView(.horizontal,showsIndicators: false) {
                    
                    LazyHStack {
                        
                        ForEach(data.results) {
                            result in
                            
                            Button {
                                //Seçili lokasyonun rengini değiştirmek için
                                selectedLocation = result.name
                                //Butona tıklandığı zaman karakterDizi değişkeni o lokasyondaki karaktelerin ID'sini alacak.
                                viewModel2.karakterDizi = extractIDs(from: result.residents)
                                viewModel2.characters = []
                                
                                //    print(karakterDizi)
                                
                            } label: {
                                Text(result.name)
                                    .foregroundColor(Color.black)
                                    .padding()
                                    .background(selectedLocation == result.name ? Color.red : Color.yellow)
                                //Seçili lokasyon kırmızı, seçili olmayan sarı renk alacak.
                                    .cornerRadius(10)
                                
                                
                            }
                            
                            
                        }
                    }
                    
                }.frame(height: 380)

                Spacer()
                
                    List(viewModel2.characters) { character in
                        
                        // Karakterler burada listelenecek.
                        HStack{
                            
                            AsyncImage(url: URL(string: character.image)){ image in
                                image.resizable()
                                    .cornerRadius(10)
                                
                            } placeholder: {
                                //  ProgressView()
                            }
                            .frame(width: 70, height: 70)
                            VStack(alignment:.leading) {
                                //Diğer view ile bağlantı sağlıyoruz.
                                NavigationLink(destination: CharacterDetail(characterName: character.name,
                                                                            characterImage: character.image,
                                                                            characterStatus: character.status,                           characterSpecy: character.species,
                                                                            characterGender: character.gender,
                                                                            characterOrigin:character.origin,
                                                                            characterLocation: character.location,
                                                                            characterEpisodes: character.episode,
                                                                            characterCreated: character.created
                                                                            
                                                                           )) {
                                    Text(character.name)
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.white)
                                    
                                }
                                //Cinsiyete göre farklı bir resim koyuyoruz.
                                if(character.gender == "Male")
                                {
                                    HStack {
                                        Text(character.gender)
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.blue)
                                        Image(systemName: "mustache.fill")
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    
                                }
                                else if (character.gender == "Female")
                                {
                                    HStack{
                                        Text(character.gender)
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.red)
                                        Image(systemName: "mouth.fill")
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    
                                }
                                else {
                                    HStack {
                                        Text(character.gender)
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.gray)
                                        Image(systemName: "person.fill.questionmark")
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            
                        }.listRowBackground(Color.clear)
                    }.padding(.top,-170)
                        .padding(.bottom,10)
                        .padding(.horizontal,-15)
                        .onReceive(viewModel2.$karakterDizi) { newValue in
                            viewModel2.fetchCharacters(ids: viewModel2.karakterDizi)
                            //Seçili lokasyondaki karakterleri getirmek için karakterDizi değişkenini fonksiyona atıyoruz.
                        }.scrollContentBackground(.hidden) //Listenin standart arka plan rengini gizliyoruz.
                
            }
            Spacer()
        }
    }
    
}

    struct LocationView_Previews: PreviewProvider {
        static var previews: some View {
            LocationView()
        }
    }

