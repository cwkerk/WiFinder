//
//  ITunesSearchViewController.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 19/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

class ITunesSearchViewController: UIViewController {
  private var searchViewModel: ITunesSearchViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.searchViewModel = ITunesSearchViewModel(viewController: self)
  }

}
