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
  @State private var damping: Double
  @State private var stiffness: Double
  
  // MARK: State Variables for ease in and ease in/out
  @State private var duration: Double
  
  // MARK: - Private Constants
  private let animationType: AnimationType
  
  // MARK: - Initializer
  init(_ animationAmount: Binding<CGFloat>,_ animationType: AnimationType) {
    self._animationAmount = animationAmount
    self.animationType = animationType
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
    case .spring(let stiffness, let damping):
      return .customSpring(stiffness: stiffness, damping: damping)
    case .easeIn(let duration):
      return .customEaseIn(duration: duration)
    case .easeInOut(let duration):
      return .customEaseIn(duration: duration)
    }
  }
  
  func createAnimationAdjuster() -> some View {
    switch animationType {
    case .spring:
      return VStack {
        Slider(value: $stiffness, in: 0...50, label: { Text("Change Stiffness") })
        Stepper("Change Damping", value: $damping, in: 0...5)
      }
    case .easeIn:
      return Text("Ease In")
    case .easeInOut:
      return Text("Ease in out")
    }
  }
}

struct TestButton_Previews: PreviewProvider {
  static var previews: some View {
    TestButton(.constant(0), .easeIn(1))
  }
}
