//
//  HomeView.swift
//  Animations
//
//  Created by Alex Jang on 12/17/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      TabView {
        CustomAnimations()
          .tabItem {
            Image(systemName: "bell")
            Text("Custom Animations")
          }
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
