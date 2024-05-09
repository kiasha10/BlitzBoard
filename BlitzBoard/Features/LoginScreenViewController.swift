// LoginScreenViewController.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//
import UIKit

class LoginScreenViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    private lazy var viewModel = LoginViewModel(delegate: self)
    
    // MARK: IBActions
    
    @IBAction private func loginButtonTapped(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        viewModel.authenticate(email: email, password: password)
    }
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension LoginScreenViewController: LoginViewModelDelegate {
    func loginResult(isSuccessful: Bool) {
    }
    
    func reloadView() {
        
    }
}
