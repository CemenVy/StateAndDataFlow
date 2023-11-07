//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.user.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .environmentObject(userManager)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(UserManager())
    }
}
