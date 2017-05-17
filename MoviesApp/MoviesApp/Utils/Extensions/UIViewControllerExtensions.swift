//
//  UIViewControllerExtensions.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/16/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import MBProgressHUD
import UIKit

extension UIViewController {
    
    /**
     Display a message to user which hides automatically after 3 seconds or after a given optional time
     */
    func showErrorMessage(_ message: String, afterDelay delay: TimeInterval = 3.0) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.detailsLabel.text = message
        hud.hide(animated: true, afterDelay: delay)
    }
}
