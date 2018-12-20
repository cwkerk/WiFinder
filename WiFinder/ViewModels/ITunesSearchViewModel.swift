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
  private let searchResults: BehaviorRelay<[ITunesSearchResult]>
  private let viewController: ITunesSearchViewController
  
  public var mediaType: ITunesSearchMedia = .music
  
  init(viewController: ITunesSearchViewController) {
    self.searchResults = BehaviorRelay<[ITunesSearchResult]>(value: [])
    self.viewController = viewController
    super.init()
    if let tabBarController = viewController.tabBarController {
      self.addObserver(tabBarController, forKeyPath: "selectedIndex", options: [.new], context: nil)
    }
  }
  
  deinit {
    if let tabBarController = viewController.tabBarController {
      self.removeObserver(tabBarController, forKeyPath: "selectedIndex")
    }
  }
  
  override func observeValue(
    forKeyPath keyPath: String?,
    of object: Any?, change: [NSKeyValueChangeKey : Any]?,
    context: UnsafeMutableRawPointer?
  ) {
    if let key = keyPath, key == "selectedIndex" {
      switch change?[NSKeyValueChangeKey.newKey] as? Int {
        case .some(0): self.mediaType = .music
        case .some(1): self.mediaType = .movie
        case .some(2): self.mediaType = .tvShow
        default: break
      }
    }
  }
  
  private func search(hints: [String]) {
    self.model.search(hints: hints, media: self.mediaType)?
      .bind(to: self.searchResults)
      .disposed(by: self.disposeBag)
  }
}
