//
//  CustomAnimations.swift
//  Animations
//
//  Created by Alex Jang on 12/17/20.
//

import SwiftUI

struct CustomAnimations: View {
  // MARK: - State Variables
  @State private var animationAmount: CGFloat = 1
  
  // MARK: - Private Variables
  private let animationTypes = ["Ease In", "Ease In Explicit", "AutoReverse", "Repeat Forever"]
  // MARK: - Body
  var body: some View {
    List(animationTypes, id: \.self) { animations in
      Text(animations)
    }
    
    
//    TestButton(animationAmount: $animationAmount)
//      .scaleEffect(animationAmount)
//      .animation(
//        Animation.easeInOut(duration: 1)
//          .repeatCount(3, autoreverses: true)
//      )
  }
}

struct CustomAnimations_Previews: PreviewProvider {
  static var previews: some View {
    CustomAnimations()
  }
}
