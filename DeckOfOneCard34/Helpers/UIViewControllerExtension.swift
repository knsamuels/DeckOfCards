//
//  UIViewControllerExtension.swift
//  DeckOfOneCard34
//
//  Created by Kristin Samuels  on 6/16/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentErrorToUser(localizedError: LocalizedError) {
        // Alert from error.
        let alertController = UIAlertController(title: "ERROR", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        // Dismiss action.
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        // Present alert.
        present(alertController, animated: true)
    }
}
