//
//  LoginViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

class LoginViewModel {
    // MARK: - Properties
    private let validEmail = "user@example.com"
    private let validPassword = "password123"
    // MARK: - Public Methods
    func validateCredentials(email: String?, password: String?) -> Bool {
        guard let email = email, !email.isEmpty,
              let password = password, !password.isEmpty else {
            return false // Either email or password is empty
        }
        return email == validEmail && password == validPassword
    }
}
