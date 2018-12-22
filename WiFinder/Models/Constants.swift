//
//  Constants.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 20/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import Foundation

let BASE_URL = "https://itunes.apple.com"
let SEARCH_URL = "\(BASE_URL)/search"

enum ITunesSearchMedia: String, CaseIterable {
  case movie, music, tvShow
}
