//
//  ContentView.swift
//  Medium-SwiftRealm
//
//  Created by Batuhan Küçükyıldız on 21.08.2023.
//

import SwiftUI

struct RegisterView: View {
    @State var email  = ""
    @State var password  = ""
    var body: some View {
        VStack{
            HStack{
                Text("Hesap Oluştur").font(.title)
                    .fontWeight(.bold)
                Spacer()
                
            }.padding(.horizontal , 25)
                .padding(.top , 30)
            
            
            VStack(alignment: .leading, spacing: 15){
                Text("Email").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                TextField("Email" , text: $email)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(5)
                    .shadow(color: Color.white.opacity(0.1), radius: 5 ,x: 0 ,  y:5)
                    .shadow(color: Color.white.opacity(0.08), radius: 5 ,x: 0 ,  y:-5)
                
                Text("Parola").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                TextField("Parola" , text: $password)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(5)
                    .shadow(color: Color.white.opacity(0.1), radius: 5 ,x: 0 ,  y:5)
                    .shadow(color: Color.white.opacity(0.08), radius: 5 ,x: 0 ,  y:-5)
                
            }.padding(.horizontal , 25)
                .padding(.top , 25)
            
            Button(action: {}){
                Text("Kayıt Ol")
                    .font(.system(size:20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(
                        LinearGradient(gradient :Gradient(colors: [Color.blue , Color.purple]),
                                       startPoint: .trailing , endPoint: .leading))
                    .cornerRadius(10)
            
            }.padding(.horizontal ,25)
                .padding(.top ,20)
        }
        
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .preferredColorScheme(.dark) // Koyu modda önizleme yapar

    }
}
