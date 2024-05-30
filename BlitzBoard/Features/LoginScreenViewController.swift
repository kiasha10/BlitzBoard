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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
               if self.view.frame.origin.y == 0 {
                   self.view.frame.origin.y -= 190
               }
           }
       }

       @objc private func keyboardWillHide(notification: NSNotification) {
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y = 0
           }
       }
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
