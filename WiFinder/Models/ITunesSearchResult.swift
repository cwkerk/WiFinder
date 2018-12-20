//
//  ITunesSearchResult.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 19/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import SwiftyJSON

struct ITunesSearchResult {
  let description: String
  let imagePath: String
  let name: String
  let previewPath: String
  
  init(json: JSON, media: ITunesSearchMedia) {
    self.imagePath = json["artworkUrl100"].stringValue
    self.previewPath = json["previewUrl"].stringValue
    switch media {
      case .movie:
        self.description = json["longDescription"].stringValue
        self.name = json["trackName"].stringValue
      case .music:
        self.description = json["artistName"].stringValue
        self.name = json["trackName"].stringValue
      case .tvShow:
        self.description = json["longDescription"].stringValue
        self.name = json["artistName"].stringValue
    }
  }
}
