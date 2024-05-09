// LoginViewModel.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func loginResult(isSuccessful: Bool)
}

class LoginViewModel {
    
    // MARK: - Private Variables
    
    private let validEmail = "kiashar@gmail.com"
    private let validPassword = "Kiasha1006"
    weak var delegate: LoginViewModelDelegate?
    
    init(delegate: LoginViewModelDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Public Functions
    
    func authenticate(email: String?, password: String?) -> Bool {
        guard let email, email.isEmpty,
              let password, password.isEmpty else {
            delegate?.loginResult(isSuccessful: false)
            return false
        }
        
        let isSuccessful = email == validEmail && password == validPassword
        delegate?.loginResult(isSuccessful: isSuccessful)
        
        return email == validEmail && password == validPassword
    }
}
