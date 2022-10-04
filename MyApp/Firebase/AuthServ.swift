//
//  AuthServ.swift
//  MyApp
//
//  Created by Максим Боталов on 05.10.2022.
//

import Foundation
import FirebaseAuth

class AuthServ {
    static let shared = AuthServ()
    
    private let auth = Auth.auth()
    
    func createUser(email: String?, password: String?, repeatPassword: String?, completion: @escaping (Result<User, Error>) -> Void) {
        guard let email = email, let password = password, let repeatPassword = repeatPassword else {
            completion(.failure(ErrorAuth.unknownError))
            return
        }
        
        guard ValidateAuth.checkFields(email: email, password: password, repeatPassword: repeatPassword) else {
            completion(.failure(ErrorAuth.notField))
            return
        }
        
        guard ValidateAuth.checkEmail(email: email) else {
            completion(.failure(ErrorAuth.invalidEmail))
            return
        }
        
        guard ValidateAuth.checkPassword(password) else {
            completion(.failure(ErrorAuth.invalidPassword))
            return
        }
        
        guard ValidateAuth.checkPasswordMatch(password: password, repeatPassword: repeatPassword) else {
            completion(.failure(ErrorAuth.passwordNotMatched))
            return
        }
        
        auth.createUser(withEmail: email, password: password) { result, error in
            guard let user = result?.user else {
                completion(.failure(error?.localizedDescription as! Error))
                return
            }
            completion(.success(user))
        }
    }
}
