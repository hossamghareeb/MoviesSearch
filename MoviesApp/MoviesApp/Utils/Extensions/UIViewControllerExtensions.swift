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
    
    func showErrorMessage(_ message: String) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.detailsLabel.text = message
        hud.hide(animated: true, afterDelay: 3)
    }
}
