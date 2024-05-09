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
        if email == "kiashar@gmail.com" && password == "Kiasha1006" {
            print("Login successful!")
        } else {
            showAlert(message: "Please check login credentials.")
        }
    }
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - Public Functions
    
}

extension LoginScreenViewController: ViewModelDelegate {
    func reloadView() {
        
    }
    
    func show(error: String) {
        showAlert(message: "Please check login credentials")
    }
}
