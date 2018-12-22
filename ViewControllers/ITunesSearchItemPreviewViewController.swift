//
//  ITunesSearchItemPreviewViewController.swift
//  WiFinder
//
//  Created by Chin Wee Kerk on 22/12/2018.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

class ITunesSearchItemPreviewViewController: UIViewController {
  
  public var mediaType: ITunesSearchMedia = .movie
  public var previewPath: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    print("\(self.mediaType): \(self.previewPath)")
    // Do any additional setup after loading the view.
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
