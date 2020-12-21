//
//  TransitionAnimationView.swift
//  Animations
//
//  Created by Alex Jang on 12/21/20.
//

import SwiftUI

enum TransitionType {
  case normal, pivot
}

struct TransitionAnimationView: View {
  
  // MARK: - State Variables
  @State private var isShowingRed: Bool
  
  // MARK: - Transition Type
  private let transitionType: TransitionType
  
  init(_ transitionType: TransitionType) {
    self._isShowingRed = .init(initialValue: false)
    self.transitionType = transitionType
  }
  
  // MARK: - Body
  var body: some View {
    VStack {
      Button("Tap Me") {
        withAnimation {
          isShowingRed.toggle()
        }
      }
      
      if isShowingRed {
        Rectangle()
          .fill(Color.red)
          .frame(width: 200, height: 200)
          .transition(
            transitionType == .normal ? .asymmetric(insertion: .scale, removal: .opacity) : .pivot)
      }
    }
  }
}

struct TransitionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    TransitionAnimationView(.normal)
  }
}
