// LoginScreenViewController.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//
import UIKit

class LoginScreenViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: IBActions
    
    @IBAction private func loginButtonTapped(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        viewModel.authenticate(email: email, password: password)
    }
    
    // MARK: Private Variables
    
    private lazy var viewModel = LoginViewModel(delegate: self)
}

// MARK: Extensions

extension LoginScreenViewController: LoginViewModelDelegate {
    
    func navigateToHomeScreen() {
        performSegue(withIdentifier: "HomeScreenSegue", sender: self)
    }
    
    func showError(message: String) {
        showAlert(message: "Please Check Login credentials")
    }
}
