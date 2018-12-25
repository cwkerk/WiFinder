//
//  UIViewExtension.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 24/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

extension UIView {
  
  public func bounce(completion: ((Bool) -> Void)?) {
    self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    UIView.animate(
      withDuration: ANIMATION_PERIOD_IN_SEC,
      delay: ANIMATION_DELAY_IN_SEC,
      usingSpringWithDamping: ANIMATION_SPRING_DAMPING_RATIO,
      initialSpringVelocity: ANIMATION_SPRING_INITIAL_VELOCITY,
      options: [.allowAnimatedContent, .curveEaseOut],
      animations: {
        self.transform = CGAffineTransform.identity
      },
      completion: completion
    )
  }
  
}
