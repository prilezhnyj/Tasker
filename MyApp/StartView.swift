//
//  ContentView.swift
//  MyApp
//
//  Created by Максим Боталов on 28.09.2022.
//

import SwiftUI

struct StartView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var repetPassword: String = ""
    
    @State private var showRegView = false
    @State private var showAuthView = false
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea(.all)
            
            
            VStack {
                VStack(spacing: 0) {
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Таскер")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                        Text("Твой умный ежедневник")
                            .font(.system(size: 20, weight: .medium, design: .default))
                        
                    }
                    
                    Spacer()
                    
                    Image("StartImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Button {
                            showAuthView = false
                            showRegView.toggle()
                        } label: {
                            Text("Регистрация")
                                .font(.system(size: 14, weight: .semibold, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(height: 42)
                                .foregroundColor(Color.white)
                                .background(Color("Blue"))
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .padding(.horizontal, 20)
                                .shadow(color: Color("Blue").opacity(0.5), radius: 10, x: 0, y: 4)
                        }
                        Button {
                            showRegView = false
                            showAuthView.toggle()
                        } label: {
                            Text("Авторизация")
                                .font(.system(size: 14, weight: .semibold, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(height: 42)
                                .foregroundColor(Color("Blue"))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("Blue"), lineWidth: 2))
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .padding(.horizontal, 20)
                                .shadow(color: Color("Blue").opacity(0.5), radius: 10, x: 0, y: 4)
                        }
                    }
                    
                    Spacer()
                    
                    Text("Copyright © 2022 Максим Боталов | Все права защищены.")
                        .font(.system(size: 10, weight: .medium, design: .default))
                        .foregroundColor(Color("Blue"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color.white)
            .cornerRadius(showRegView ? 20 : 0)
            .cornerRadius(showAuthView ? 20 : 0)
            .offset(y: showRegView ? -470 : 0)
            .offset(y: showAuthView ? -315 : 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
            .onTapGesture {
                showRegView = false
                showAuthView = false
            }
            .ignoresSafeArea(.all)
            
            RegistrationView(email: $email, password: $password, repetPassword: $repetPassword)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .offset(y: showRegView ? 0 : screen.height)
            
            AuthorizationView(email: $email, password: $password)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .offset(y: showAuthView ? 0 : screen.height)
        }
        
        
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
