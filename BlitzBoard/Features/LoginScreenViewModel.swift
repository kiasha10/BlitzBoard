// LoginModel.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.

import Foundation

class LoginViewModel {
    
    // MARK: - Private Variables
    
    private let validEmail = "user@example.com"
    private let validPassword = "password123"
    
    // MARK: - Public Functions
    
    func authenticate(email: String?, password: String?) -> Bool {
        guard let email, email.isEmpty,
              let password, password.isEmpty else {
            return false
        }
        
        return email == validEmail && password == validPassword
    }
}
