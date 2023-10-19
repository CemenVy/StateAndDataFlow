//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var userManager = UserManager()
    
    var body: some View {
        Group {
            if userManager.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .environmentObject(userManager)
    }
}

#Preview {
    RootView()
}
