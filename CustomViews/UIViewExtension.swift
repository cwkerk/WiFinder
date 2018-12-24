//
//  UIViewExtension.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 24/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

extension UIView {
  
  public func bounce(completion: ((Bool) -> Void)?, loopCount: Int? = 3) {
    self.singleBounce(completion: completion, loopCountLeft: 3)
  }
  
  private func singleBounce(completion: ((Bool) -> Void)?, loopCountLeft: Int? = 1) {
    guard let count = loopCountLeft, count > 0 else {
      completion?(true)
      return
    }
    self.expand { (success) in
      if success {
        self.compress { (success) in
          if success {
            self.singleBounce(completion: completion, loopCountLeft: count - 1)
          }
        }
      }
    }
  }
  
  private func compress(completion: ((Bool) -> Void)?) {
    UIView.animate(
      withDuration: ANIMATION_PERIOD_IN_SEC,
      delay: ANIMATION_DELAY_IN_SEC,
      usingSpringWithDamping: ANIMATION_SPRING_DAMPING_RATIO,
      initialSpringVelocity: ANIMATION_SPRING_INITIAL_VELOCITY,
      options: [.allowAnimatedContent, .curveEaseOut],
      animations: {
        self.transform = CGAffineTransform(scaleX: 1, y: 1)
      },
      completion: completion
    )
  }
  
  private func expand(completion: ((Bool) -> Void)?) {
    UIView.animate(
      withDuration: ANIMATION_PERIOD_IN_SEC,
      delay: ANIMATION_DELAY_IN_SEC,
      usingSpringWithDamping: ANIMATION_SPRING_DAMPING_RATIO,
      initialSpringVelocity: ANIMATION_SPRING_INITIAL_VELOCITY,
      options: [.allowAnimatedContent, .curveEaseOut],
      animations: {
        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
      },
      completion: completion
    )
  }
  
}
