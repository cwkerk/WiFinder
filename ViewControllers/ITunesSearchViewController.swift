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
  
  public var mediaType: ITunesSearchMedia {
    switch self.tabBarController?.selectedIndex {
      case .some(0): return .music
      case .some(1): return .movie
      case .some(2): return .tvShow
      default: fatalError("Unexpected encounter for unknown media type")
    }
  }
  
  @IBOutlet weak var searcher: UISearchBar!
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // create view model after all view relevant logics finished
    self.searchViewModel = ITunesSearchViewModel(viewController: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch (segue.destination, segue.identifier, sender) {
      case (
        let vc as ITunesSearchItemPreviewViewController,
        .some(let id),
        .some(let item as ITunesSearchResult)
      ) where id == "preview":
        vc.mediaEntity = item
        vc.mediaType = self.mediaType
      default:
        break
    }
  }
  
  public func showPreview(item: ITunesSearchResult) {
    self.performSegue(withIdentifier: "preview", sender: item)
  }

}
