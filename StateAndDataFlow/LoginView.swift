//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userManager: UserManager
    private let storageManager = StorageManager.shared
    @State private var name = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
        }
    }
    
    private func login() {
        if !name.isEmpty {
            userManager.user.name = name
            userManager.user.isLoggedIn.toggle()
            storageManager.save(user: userManager.user)
        }
    }
}

#Preview {
    LoginView()
}
