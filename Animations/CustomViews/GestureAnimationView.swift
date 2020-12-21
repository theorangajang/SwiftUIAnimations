//
//  GestureAnimationView.swift
//  Animations
//
//  Created by Alex Jang on 12/19/20.
//

import SwiftUI

struct GestureAnimationView: View {
  let letters = Array("Hello SwiftUI")
  @State private var dragAmount = CGSize.zero
  @State private var enabled = false
  
  var body: some View {
    HStack(spacing: 0) {
      ForEach(0..<letters.count) { (num) in
        Text(String(letters[num]))
          .padding(5)
          .font(.title)
          .background(enabled ? Color.blue : Color.red)
          .offset(dragAmount)
          .animation(Animation.default.delay(Double(num)/20))
      }
    }
    .gesture(
      DragGesture()
        .onChanged { dragAmount = $0.translation }
        .onEnded { _ in
          dragAmount = .zero
          enabled.toggle()
        }
    )
  }
}

struct GestureAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    GestureAnimationView()
  }
}
