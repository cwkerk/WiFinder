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
  
  @IBOutlet weak var thumbnailView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  public func render(result: ITunesSearchResult) {
    self.thumbnailView.image = UIImage.from(path: result.imagePath)
    self.nameLabel.text = result.name
    self.descriptionLabel.text = result.description
  }
  
}
