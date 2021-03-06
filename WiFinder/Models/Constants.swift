//
//  Constants.swift
//  WiFinder
//
//  Created by Kerk Chin Wee on 20/12/18.
//  Copyright © 2018 Chin Wee Kerk. All rights reserved.
//

import UIKit

let HOST = "itunes.apple.com"
let AUDIO_HOST = "https://audio-ssl.\(HOST)"
let VIDEO_HOST = "https://video-ssl.\(HOST)"
let SEARCH_URL = "https://\(HOST)/search"

let ANIMATION_DELAY_IN_SEC: TimeInterval = 0
let ANIMATION_PERIOD_IN_SEC: TimeInterval = 2.0
let ANIMATION_SPRING_DAMPING_RATIO: CGFloat = 0.2
let ANIMATION_SPRING_INITIAL_VELOCITY: CGFloat = 6.0
let KEYBOARD_RESPONSE_DELAY: TimeInterval = 0.25

enum ITunesSearchMedia: String, CaseIterable {
  case movie, music, tvShow
}
