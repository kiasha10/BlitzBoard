//
//  ViewController+Extension.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/08.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
