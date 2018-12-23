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
  private var tableViewRefreshControl: UIRefreshControl!
  
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
    // Add UIRefreshControl to UITableView
    self.tableViewRefreshControl = UIRefreshControl()
    self.tableViewRefreshControl.addTarget(
      self,
      action: #selector(self.refresh),
      for: [.valueChanged]
    )
    if #available(iOS 10.0, *) {
      self.tableView.refreshControl = self.tableViewRefreshControl
    } else {
      self.tableView.addSubview(self.tableViewRefreshControl)
    }
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
  
  public func startRefresher() {
    DispatchQueue.main.async {
      self.tableViewRefreshControl.beginRefreshing()
    }
  }
  
  public func stopRefresher() {
    DispatchQueue.main.async {
      self.tableViewRefreshControl.endRefreshing()
    }
  }
  
  @objc private func refresh() {
    self.searchViewModel.search(hints: "")
  }

}
