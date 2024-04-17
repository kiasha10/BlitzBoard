//
//  LoginViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import UIKit


class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup if needed
    }
    
    // MARK: - Actions//    @IBAction func login(_ sender: Any)//
       @IBAction func loginButtonTapped(_ sender: Any)
    {
        
//        guard let email = emailTextField.text, !email.isEmpty,
//              let password = passwordTextField.text, password.isEmpty else {
//            showAlert(message: "Please enter both email and password.")
//            return
//        }
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if email == "user@example.com" && password == "password123" {
            // Login successful
            print("Login successful!")
            // Navigate to next screen or perform segue
        } else {
            // Login failed
            showAlert(message: "Invalid email or password.")
        }
    }
    
    // MARK: - Helper Methods
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

