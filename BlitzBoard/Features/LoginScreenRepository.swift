// LoginScreenRepository.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//
import Foundation

class LoginScreenRepository {
    
    private let loginModel = LoginModel()
    
  func authenticate(email: String?, password: String?, completion: @escaping (Bool) -> Void) {
    let isAuthenticated = loginModel.authenticate(email: email, password: password)
    completion(isAuthenticated)
  }
}
