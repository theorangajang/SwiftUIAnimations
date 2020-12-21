//
//  TestButton.swift
//  Animations
//
//  Created by Alex Jang on 12/17/20.
//

import SwiftUI

struct TestButton: View {
  // MARK: - Bindings
  @Binding var animationAmount: CGFloat
  
  // MARK: - State Variables for spring
  @Binding private var damping: Double
  @Binding private var stiffness: Double
  
  // MARK: State Variables for ease in and ease in/out
  @Binding private var duration: Double
  
  // MARK: - Private Constants
  private let animationType: AnimationType
  
  // MARK: - Initializer
  init(_ animationAmount: Binding<CGFloat>,
       _ animationType: AnimationType,
       _ damping: Binding<Double>,
       _ stiffness: Binding<Double>,
       _ duration: Binding<Double>) {
    self._animationAmount = animationAmount
    self.animationType = animationType
    self._damping = damping
    self._stiffness = stiffness
    self._duration = duration
  }
  
  // MARK: - Body
  var body: some View {
    Button("Tap Me") {
      withAnimation(setAnimation()) {
        animationAmount += 1
      }
    }
    .padding(50)
    .background(Color.red)
    .foregroundColor(.white)
    .clipShape(Circle())
  }
}

// MARK: - Private Functions
private extension TestButton {
  func setAnimation() -> Animation {
    switch animationType {
    case .spring:
      return .customSpring(stiffness: stiffness, damping: damping)
    case .easeIn:
      return .customEaseIn(duration: duration)
    case .easeInOut:
      return .customEaseIn(duration: duration)
    }
  }
}

struct TestButton_Previews: PreviewProvider {
  static var previews: some View {
    TestButton(.constant(0), .easeIn, .constant(0), .constant(0), .constant(0))
  }
}
