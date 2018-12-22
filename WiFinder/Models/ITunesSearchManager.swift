//
//  ITunesSearchAPIModel.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 19/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import Alamofire
import RxSwift
import SwiftyJSON

struct ITunesSearchManager {
  
  func search(hints:[ String], media: ITunesSearchMedia) -> Observable<[ITunesSearchResult]>? {
    let term = hints.joined(separator: "+")
    let path = "\(SEARCH_URL)?term=\(term)&media=\(media.rawValue)&limit=25&sort=recent"
    guard let url = URL(string: path) else { return nil }
    return Observable<Data>.create { (observable) -> Disposable in
      Alamofire.request(
        url,
        method: .get,
        parameters: nil,
        encoding: URLEncoding(),
        headers: nil
        ).responseJSON(
          queue: DispatchQueue.global(),
          options: JSONSerialization.ReadingOptions.mutableContainers
        ) { (response) in
          switch (response.data, response.error) {
          case (_, .some(let error)):
            observable.onError(error)
          case (.some(let data), _):
            observable.onNext(data)
            observable.onCompleted()
          default:
            break
          }
      }
      return Disposables.create {
        // do anything needed when clean up.
      }
    }
    .flatMap({ (data) -> Observable<[ITunesSearchResult]> in
      do {
        let json = try JSON(data: data)
        let results = json["results"].arrayValue
        return Observable.of(results.map({ (result) -> ITunesSearchResult in
          return ITunesSearchResult(json: result, media: media)
        }))
      } catch {
        throw error
      }
    })
  }
  
}
