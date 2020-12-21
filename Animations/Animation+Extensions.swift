//
//  Animation+Extensions.swift
//  Animations
//
//  Created by Alex Jang on 12/18/20.
//

import SwiftUI

enum AnimationType {
  case spring
  case easeIn
  case easeInOut
}

extension Animation {
  static func customSpring(stiffness: Double, damping: Double) -> Self {
    .interpolatingSpring(stiffness: stiffness, damping: damping)
  }
  
  static func customEaseIn(duration: Double) -> Self {
    .easeIn(duration: duration)
  }
  
  static func customEaseInOut(duration: Double) -> Self {
    .easeInOut(duration: duration)
  }
}
