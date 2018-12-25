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
  
  @IBOutlet weak var thumbnailButton: UIButton!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  public func render(result: ITunesSearchResult) {
    UIImage.from(path: result.imagePath) { (image) in
      self.thumbnailButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    self.thumbnailButton.layer.cornerRadius = 10
    self.nameLabel.text = "Title: \(result.name)"
    self.descriptionLabel.text = result.description
  }
  
  @IBAction func thumbnailPressed(_ sender: Any) {
    self.resignFirstResponder()
    self.thumbnailButton.bounce(completion: nil)
  }
  
}
