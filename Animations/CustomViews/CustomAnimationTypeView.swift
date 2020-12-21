//
//  CustomAnimationTypeView.swift
//  Animations
//
//  Created by Alex Jang on 12/17/20.
//

import SwiftUI

struct CustomAnimationTypeView: View {
  @Binding var animationAmount: CGFloat
  private let animationType: AnimationType
  private let title: String
  
  init(_ title: String,_ animationType: AnimationType,_ animationAmount: Binding<CGFloat>) {
    self.title = title
    self.animationType = animationType
    self._animationAmount = animationAmount
  }
  
  var body: some View {
    TestButton($animationAmount, animationType)
      .scaleEffect(animationAmount)
      .navigationTitle(title)
      .navigationBarTitleDisplayMode(.inline)
  }
}

struct CustomAnimationTypeView_Previews: PreviewProvider {
  static var previews: some View {
    CustomAnimationTypeView("Tap Me", .easeIn(0), .constant(1))
  }
}
