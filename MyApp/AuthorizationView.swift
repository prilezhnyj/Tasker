//
//  AuthorizationView.swift
//  MyApp
//
//  Created by Максим Боталов on 28.09.2022.
//

import SwiftUI

struct AuthorizationView: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "envelope")
                            .foregroundColor(Color("Gray"))
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .frame(width: 25, height: 25, alignment: .center)
                            .padding(.leading, 10)
                        
                        TextField("Ваша почта", text: $email)
                            .foregroundColor(Color("Gray"))
                            .font(.system(size: 14, weight: .semibold, design: .default))
                            .frame(maxWidth: .infinity)
                            .padding(.trailing, 10)
                    }
                    .frame(height: 42, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .background(Color("LightGray"))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "lock")
                            .foregroundColor(Color("Gray"))
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .frame(width: 25, height: 25, alignment: .center)
                            .padding(.leading, 10)
                        
                        TextField("Ваш пароль", text: $password)
                            .foregroundColor(Color("Gray"))
                            .font(.system(size: 14, weight: .semibold, design: .default))
                            .frame(maxWidth: .infinity)
                            .padding(.trailing, 10)
                    }
                    .frame(height: 42, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .background(Color("LightGray"))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                }
                .padding(.top, 20)
                
                Button {
                    //
                } label: {
                    Text("Авторизация")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 42)
                        .foregroundColor(Color.white)
                        .background(Color("Blue"))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .padding(.horizontal, 20)
                        .shadow(color: Color("Blue").opacity(0.5), radius: 10, x: 0, y: 4)
                }
                
                HStack(spacing: 10) {
                    Text("Нет аккаунта?")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                    
                    Button {
                        //
                    } label: {
                        Text("Зарегистрироваться")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(Color("Blue"))
                            .shadow(color: Color("Blue").opacity(0.5), radius: 10, x: 0, y: 4)
                    }
                    
                }
                .padding(.bottom, 20)
                
                
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .padding(20)
        }
    }
}

struct LoginInView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView(email: .constant(""), password: .constant(""))
    }
}
