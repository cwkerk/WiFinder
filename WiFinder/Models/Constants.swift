//
//  Constants.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 20/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

let BASE_URL = "https://itunes.apple.com"
let SEARCH_URL = "\(BASE_URL)/search"

enum ITunesSearchMedia: String, CaseIterable {
  case movie, music, tvShow
}

extension UIImage {

  static func from(path: String) -> UIImage? {
    guard let url = URL(string: path) else { return nil }
    do {
      let data = try Data(contentsOf: url, options: [.mappedIfSafe])
      return UIImage(data: data)
    } catch {
      fatalError(error.localizedDescription)
    }
  }

}
