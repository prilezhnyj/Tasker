//
//  RegistrationView.swift
//  MyApp
//
//  Created by Максим Боталов on 28.09.2022.
//

import SwiftUI

struct RegistrationView: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var repetPassword: String
    
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
                        
                        SecureField("Ваш пароль", text: $password)
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
                        
                        SecureField("Повторите ваш пароль", text: $repetPassword)
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
                    AuthServ().createUser(email: email, password: password, repeatPassword: repetPassword) { result in
                        switch result {
                        case .success(let user):
                            print(user.email!)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
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
                
                HStack(spacing: 10) {
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .foregroundColor(Color("LightGray"))
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                    
                    Text("или")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                    
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .foregroundColor(Color("LightGray"))
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 10) {
                    Button {
                        //
                    } label: {
                        Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(10)
                            .frame(height: 42)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("LightGray"), lineWidth: 2))
                    }
                    
                    Button {
                        //
                    } label: {
                        Image("apple")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(10)
                            .frame(height: 42)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("LightGray"), lineWidth: 2))
                    }
                    
                    Button {
                        //
                    } label: {
                        Image("facebook")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(10)
                            .frame(height: 42)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("LightGray"), lineWidth: 2))
                    }
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 10) {
                    Text("Уже есть аккаунт?")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                    
                    Button {
                        //
                    } label: {
                        Text("Войти")
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(email: .constant(""), password: .constant(""), repetPassword: .constant(""))
    }
}
