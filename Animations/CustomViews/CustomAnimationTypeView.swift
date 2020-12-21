//
//  CustomAnimationTypeView.swift
//  Animations
//
//  Created by Alex Jang on 12/17/20.
//

import SwiftUI

struct CustomAnimationTypeView: View {
  // MARK: - Binding Variables
  @Binding var animationAmount: CGFloat
  
  // MARK: - State Variables for spring animation
  @State private var damping: Double
  @State private var stiffness: Double
  
  // MARK: State Variable for ease in and ease in/out animation
  @State private var duration: Double
  
  // MARK: - Private Constants
  private let animationType: AnimationType
  private let title: String
  
  // MARK: - Initializer
  init(_ title: String,
       _ animationType: AnimationType,
       _ animationAmount: Binding<CGFloat>) {
    self.title = title
    self.animationType = animationType
    self._animationAmount = animationAmount
    self._damping = .init(initialValue: 0)
    self._stiffness = .init(initialValue: 0)
    self._duration = .init(initialValue: 0)
  }
  
  // MARK: - Body
  var body: some View {
    VStack(spacing: 100){
      TestButton($animationAmount, animationType, $damping, $stiffness, $duration)
        .scaleEffect(animationAmount)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
      
      createAdjusterView()
    }
  }
}

// MARK: - Private Extension
private extension CustomAnimationTypeView {
  @ViewBuilder func createAdjusterView() -> some View {
    switch animationType {
    case .spring:
      VStack {
        HStack {
          Text("0")
          Slider(value: $stiffness, in: 0...50)
          Text("50")
        }
        Stepper("Change Damping \(damping)", value: $damping, in: 0...5)
      }
      .padding([.leading, .trailing], 16)
    case .easeIn, .easeInOut:
      Stepper("Change Duration \(duration)", value: $duration, in: 0...5)
    }
  }
}

struct CustomAnimationTypeView_Previews: PreviewProvider {
  static var previews: some View {
    CustomAnimationTypeView("Tap Me", .easeIn, .constant(1))
  }
}
