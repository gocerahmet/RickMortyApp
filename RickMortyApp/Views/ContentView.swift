//  Rick and Morty App for Invio Challenge
//  Ahmet Gocer 

import SwiftUI

struct ContentView: View {

    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    //Yatay durum için Bool değişkeni oluşturduk.
    var isLandscape: Bool { verticalSizeClass == .compact}

    @State private var selectedButton: Int? = nil
    @StateObject private var viewModel:LocationViewModel=LocationViewModel()

    var body: some View {
        
        NavigationView{
           
            ZStack{
                
                Background()
                
                VStack{
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 300.0, height: 100.0).padding(.top, isLandscape ? 20 : -10)
                    
                        //Lokasyonları ekliyoruz.
                        LocationView().padding(.top, isLandscape ? -160 : -170)
                        
                    /* Yatay durum ve dikey durum için ayrı padding değerleri veriyoruz. If else sorgusu ile manzara modunda mıyız diye sorguluyoruz. */
                    
                    // Alt kısıma boşluk ekliyoruz.
                    Spacer()
                }
                
                
                
            }
        }.tint(Color(red: 153.0, green: 0.0, blue: 0.0))
          
            }
  
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Modern bir arkaplan oluşturuyoruz.

struct Background: View{
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.1407667696, green: 0.5089942217, blue: 0.5972044468, alpha: 1)), Color(#colorLiteral(red: 0.1079011187, green: 0.3485074937, blue: 0.4073579013, alpha: 1)), Color(#colorLiteral(red: 0.09506385773, green: 0.2428356409, blue: 0.2807130218, alpha: 1)), Color(#colorLiteral(red: 0.08821473271, green: 0.1449819803, blue: 0.1618441939, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1))]
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}
