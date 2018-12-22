//
//  ITunesSearchViewModel.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 19/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import RxSwift
import RxCocoa

class ITunesSearchViewModel: NSObject {
  
  private let disposeBag = DisposeBag()
  private let model = ITunesSearchManager()
  private var searchResults = [ITunesSearchMedia: BehaviorRelay<[ITunesSearchResult]>]()
  private let viewController: ITunesSearchViewController
  
  init(viewController: ITunesSearchViewController) {
    self.viewController = viewController
    super.init()
    ITunesSearchMedia.allCases.forEach {
      self.searchResults[$0] = BehaviorRelay<[ITunesSearchResult]>(value: [])
    }
    self.bindSearcher(viewController.searcher)
    self.bindTableView(viewController.tableView)
  }
  
  public func search(hints: String) {
    let hints = hints.components(separatedBy: "+")
    self.model.search(hints: hints, media: self.viewController.mediaType)?
      .bind(to: self.searchResults[self.viewController.mediaType]!)
      .disposed(by: self.disposeBag)
  }
  
  private func bindSearcher(_ searcher: UISearchBar) {
    searcher.rx.text.orEmpty
      .distinctUntilChanged()
      .subscribe(
        onNext: self.search,
        onError: nil,
        onCompleted: nil,
        onDisposed: nil
      )
      .disposed(by: self.disposeBag)
  }
  
  private func bindTableView(_ tableView: UITableView) {
    self.searchResults[self.viewController.mediaType]?
      .bind(to: tableView.rx.items(
        cellIdentifier: ITunesSearchTableViewCell.identifier,
        cellType: ITunesSearchTableViewCell.self
      )) { (row, result, cell) in
        cell.render(result: result)
      }
      .disposed(by: self.disposeBag)
  }

}
