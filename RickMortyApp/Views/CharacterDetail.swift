//  CharacterDetail.swift
//  Rick and Morty App
//  Ahmet Gocer


import SwiftUI

// API URL'sinden ID'leri ayırmak için yazılan fonksiyon.

func extractIDs(from urls: [String]) -> String {
    var ids: [String] = []
    let pattern = #"/(\d+)/?$"#
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    
    for url in urls {
        let range = NSRange(location: 0, length: url.count)
        if let match = regex.firstMatch(in: url, options: [], range: range) {
            let id = NSString(string: url).substring(with: match.range(at: 1))
            ids.append(id)
        }
    }
    
    return ids.joined(separator: ",")
}

struct CharacterDetail: View {
    
    var characterName: String
    var characterImage: String
    var characterStatus: String
    var characterSpecy: String
    var characterGender: String
    var characterOrigin: SingleLocation
    var characterLocation: SingleLocation
    var characterEpisodes: [String]
    var characterCreated: String
    

    init(characterName: String, characterImage: String, characterStatus:String,
         characterSpecy: String, characterGender:String,
         characterOrigin: SingleLocation, characterLocation: SingleLocation, characterEpisodes: [String],characterCreated: String) {
           self.characterName = characterName
           self.characterImage = characterImage
           self.characterStatus = characterStatus
           self.characterSpecy = characterSpecy
           self.characterGender = characterGender
           self.characterOrigin = characterOrigin
           self.characterLocation = characterLocation
           self.characterEpisodes = characterEpisodes
           self.characterCreated = characterCreated
       }
    

    
    var body: some View {
      
        ZStack{
          
            Background()
        
                VStack{
                    ScrollView{
                        //Karakterlerin detay bilgilerini burada yazdırıyoruz.
                    Text(characterName)
                        .fontWeight(.bold)
                        .font(.custom("Avenir", size: 30))
                        .padding(.top,30)
                        .foregroundColor(Color.white)
                    
                    AsyncImage(url: URL(string: characterImage))
                        .frame(width: 275, height: 275)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                    
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text("Status:")
                                .frame(alignment: .trailing)
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            
                            Text(characterStatus)
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                            
                        }
                        .padding(.horizontal,20)
                        .padding(.vertical, 5)
                        
                        HStack{
                            
                            Text("Specy:")
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Text(characterSpecy)
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                            
                        }.padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        HStack{
                            
                            Text("Gender:")
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            
                            Text(characterGender)
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                            
                        }.padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        HStack{
                            
                            Text("Origin:")
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            
                            Text(characterOrigin.name)
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                            
                            
                        }.padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        HStack{
                            
                            Text("Location:")
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Text(characterLocation.name)
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                            
                        }.padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        HStack{
                            
                            Text("Episodes:")
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            let ids2 = extractIDs(from: characterEpisodes)
                            Text(ids2) // prints "123,456"
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                            
                            
                            
                        }.padding(.horizontal, 20).padding(.vertical, 5)
                        
                        HStack
                        {
                            
                            Text("Created at:")
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            
                            Text(characterCreated)
                                .font(.custom("Avenir", size: 22))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                            
                            
                        }.padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        
                        
                        
                    }.padding(.top,20).padding(.bottom, 20)
                    
                    
                    
                }
            }
        }
        
    }
}


struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetail(characterName: String(), characterImage: String(), characterStatus: String(), characterSpecy: String(), characterGender: String(), characterOrigin: SingleLocation(name: String(), url: String()), characterLocation: SingleLocation(name: String(), url: String()),characterEpisodes: [String](),characterCreated: String())
    }
}
