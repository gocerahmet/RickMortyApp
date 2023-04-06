//  Rick and Morty App for Invio Challenge
//  Ahmet Gocer

import SwiftUI


struct SplashScreenView: View {
    //İlk defa açılıp açılmadığı verisini tutan değişken
    @AppStorage("userOnBoarded") var userOnboarded: Bool = false
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    

    var body: some View {
        
        ZStack{
            Background()
            if isActive {
                ContentView()
            }
            else {
                VStack{
                    VStack{
   
                        /* Görsel ve Yazı Ekleme İşlemleri */
                        
                        Image("logo")
                            .resizable()
                            .frame(width: 300.0, height: 100.0)
                        
                        // Uygulama daha önce açıldıysa bu kısım çalışacak.
                        if(userOnboarded == true)
                         {
                          Text("Hello")
                         .font(Font.custom("Baskerville-Bold", size: 32))
                        .foregroundColor(.white.opacity(0.80))
                           }
                        
                        //Eğer daha önce uygulama açılmadıysa bu kısım çalışacak.
                          else if (userOnboarded == false)
                          {
                           Text("Welcome")
                            .font(Font.custom("Baskerville-Bold", size: 32))
                           .foregroundColor(.white.opacity(0.80))
                        }
                        else
                        {
                            Text("ERROR")
                             .font(Font.custom("Baskerville-Bold", size: 32))
                            .foregroundColor(.white.opacity(0.80))
                        }
                       
                    }
                    
                    //Açılınca değişkeni true'ya çeviriyoruz.
                    .onDisappear(){
                     userOnboarded = true
                      print(UserDefaults.standard.bool(forKey: "userOnboarded"))
                     }
               
                    //Animasyon İşlemleri burada yapılıyor.
                    
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                       
                    }
                    
               
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                    }
           
                
            }
                
        }
        
 
        }
    
    }
  


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
