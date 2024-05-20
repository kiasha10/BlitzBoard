// LoginViewModel.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func navigateToHomeScreen()
    func showError(message: String)
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
    
    func authenticate(email: String?, password: String?) {
        guard let email, !email.isEmpty,
              let password, !password.isEmpty else {
            delegate?.showError(message: "Please enter an email and/or password")
            return
        }
        
        if email == validEmail && password == validPassword {
            delegate?.navigateToHomeScreen()
        } else {
            delegate?.showError(message: "Please check login credentials")
        }
    }
}
