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
    
    private let validEmail = "kiasha@gmail.com"
    private let validPassword = "10062000"
    private weak var delegate: LoginViewModelDelegate?
    
    init(delegate: LoginViewModelDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Functions
    
    @discardableResult
    func authenticate(email: String?, password: String?) -> Bool {
        guard let email, !email.isEmpty,
              let password, !password.isEmpty else {
            delegate?.loginResult(isSuccessful: false)
            return false
        }
        
        let isSuccessful = email == validEmail && password == validPassword
        delegate?.loginResult(isSuccessful: isSuccessful)
        
        return email == validEmail && password == validPassword
    }
}
