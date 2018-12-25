//
//  ITunesSearchItemPreviewViewController.swift
//  WiFinder
//
//  Created by Chin Wee Kerk on 22/12/2018.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit
import AVFoundation

class ITunesSearchItemPreviewViewController: UIViewController {
  
  private var playerLayer: AVPlayerLayer!
  
  public var mediaEntity: ITunesSearchResult!
  public var mediaType: ITunesSearchMedia = .movie
  
  @IBOutlet weak var imageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // image will be displayed as background only when it's music
    switch self.mediaType {
      case .music:
        UIImage.from(path: self.mediaEntity.imagePath) { (image) in
          self.imageView.image = image
        }
      default:
        self.imageView.removeFromSuperview()
    }
    // Load preview
    if let url = URL(string: self.mediaEntity.previewPath) {
      self.playerLayer = AVPlayerLayer(player: AVPlayer(url: url))
      self.playerLayer.frame = self.view.bounds
      self.view.layer.addSublayer(self.playerLayer)
    } else {
      self.informativeAlert(title: "No preview is available", message: nil) { _ in
        self.navigationController?.popViewController(animated: true)
      }
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.playerLayer.player?.play()
  }
  
  override func viewWillTransition(
    to size: CGSize,
    with coordinator: UIViewControllerTransitionCoordinator
  ) {
    self.playerLayer.frame = CGRect(origin: CGPoint.zero, size: size)
  }

}
