//
//  UIImageExtension.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 24/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

extension UIImage {
  
  static func from(path: String, completion: @escaping (UIImage?) -> Void) {
    DispatchQueue.global().async {
      guard let url = URL(string: path) else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      do {
        let data = try Data(contentsOf: url)
        DispatchQueue.main.async {
          completion(UIImage(data: data))
        }
      } catch {
        DispatchQueue.main.async {
          completion(nil)
        }
      }
    }
  }
  
}
