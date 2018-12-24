//
//  UIImageExtension.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 24/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

extension UIImage {
  
  static func from(path: String) -> UIImage? {
    guard let url = URL(string: path) else { return nil }
    do {
      let data = try Data(contentsOf: url)
      return UIImage(data: data)
    } catch {
      return nil
    }
  }
  
}
