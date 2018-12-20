//
//  ITunesSearchViewModel.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 19/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import RxSwift
import RxCocoa

class ITunesSearchViewModel:  NSObject {
  private let disposeBag = DisposeBag()
  private let model = ITunesSearchManager()
  private let searchResults: BehaviorRelay<[ITunesSearchResult]>
  
  init(viewController: ITunesSearchViewController) {
    self.searchResults = BehaviorRelay<[ITunesSearchResult]>(value: [])
    super.init()
    self.search()
  }
  
  private func search() {
    self.model.search(hints: ["jackson"], media: .music)?
      .map({ (results) -> [ITunesSearchResult] in
        results.forEach({ (result) in
          print("\(result.name): \(result.description)")
        })
        return results
      })
      .bind(to: self.searchResults)
      .disposed(by: self.disposeBag)
  }
}
