//
//  UIViewController.swift
//  WiFinder
//
//  Created by Chin Wee Kerk on 23/12/2018.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func informativeAlert(
    title: String?,
    message: String?,
    handler: @escaping (UIAlertAction) -> Void
  ) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
    self.present(alert, animated: true, completion: nil)
  }
  
}
