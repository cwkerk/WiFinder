//
//  ITunesSearchTableViewCell.swift
//  WiFinder
//
//  Created by Chin Wee Kerk on 22/12/2018.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

class ITunesSearchTableViewCell: UITableViewCell {
  
  static let identifier = "ITunesSearchTableViewCell"
  
  public func render(result: ITunesSearchResult) {
    self.textLabel?.text = "\(result.name): \(result.description)"
  }
  
}
