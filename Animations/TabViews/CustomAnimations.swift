//
//  CustomAnimations.swift
//  Animations
//
//  Created by Alex Jang on 12/17/20.
//

import SwiftUI

struct CustomAnimations: View {
  // MARK: - State Variables
  @State private var animationAmount: CGFloat
  
  // MARK: - Private Variables
  private let animationTitles: [String]
  private let animationTypes: [AnimationType]
  private let rotationAnimation: [String]
  private let gestureAnimation: [String]
  private let transitionAnimation: [String]
  private let transitionTypes: [TransitionType]
  
  init() {
    self.animationTitles = ["Spring", "Ease In", "Ease In Explicit"]
    self.animationTypes = [.spring, .easeIn, .easeInOut]
    self.rotationAnimation = ["Rotation"]
    self.gestureAnimation = ["Animation Gesture"]
    self.transitionAnimation = ["Transition Animation", "Custom Transition"]
    self.transitionTypes = [.normal, .pivot]
    
    self._animationAmount = .init(initialValue: 1)
  }
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      List {
        Section(header: Text("Regular Animations")) {
          ForEach(0..<3) { (row) in
            NavigationLink(animationTitles[row], destination: CustomAnimationTypeView(animationTitles[row], animationTypes[row], $animationAmount))
          }
        }
        
        Section(header: Text("Rotation Animation")) {
          ForEach(0..<rotationAnimation.count) { (row) in
            NavigationLink(rotationAnimation[row], destination: RotationView(rotationAnimation[row]))
          }
        }
        
        Section(header: Text("Gesture Animation")) {
          ForEach(0..<gestureAnimation.count) { (row) in
            NavigationLink(gestureAnimation[row], destination: GestureAnimationView())
          }
        }
        
        Section(header: Text("Transition Animation")) {
          ForEach(0..<transitionAnimation.count) { row in
            NavigationLink(transitionAnimation[row], destination: TransitionAnimationView(transitionTypes[row]))
          }
        }
      }
      .onAppear(perform: {
        animationAmount = 1
      })
      .navigationBarHidden(true)
    }
  }
}

struct CustomAnimations_Previews: PreviewProvider {
  static var previews: some View {
    CustomAnimations()
  }
}
