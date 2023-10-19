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
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text(name.count.formatted())
                    .foregroundStyle(name.count < 3 ? .red : .green)
                    .padding(.trailing, 30)
            }
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .padding(.trailing, 35)
            .disabled(name.count < 3)
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
