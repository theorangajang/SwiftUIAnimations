//
//  RotationView.swift
//  Animations
//
//  Created by Alex Jang on 12/18/20.
//

import SwiftUI

struct RotationView: View {
  @State private var rotate: Bool
  
  // MARK: - Private Constants
  private let title: String

  // MARK: - Initializer
  init(_ title: String) {
    self.title = title
    self._rotate = .init(initialValue: false)
  }
  
  // MARK: - Body
  var body: some View {
    VStack(spacing: 10) {
      Button {
        withAnimation(.easeIn(duration: 0.1)) { rotate.toggle() }
      } label: {
        Image(systemName: "plus.circle.fill")
          .resizable()
          .frame(width: 50, height: 50)
          .rotation3DEffect(.degrees(rotate ? 45 : 0), axis: (x: 0, y: 0, z: 1))
      }

    }
  }
}

struct RotationView_Previews: PreviewProvider {
  static var previews: some View {
    RotationView("Regular Rotation")
  }
}
