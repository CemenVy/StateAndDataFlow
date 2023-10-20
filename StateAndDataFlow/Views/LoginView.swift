//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text(name.count.formatted())
                    .foregroundStyle(userManager.isNameValid ? .green : .red)
                    .padding(.trailing, 30)
            }
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .padding(.trailing, 35)
            .disabled(!userManager.isNameValid)
        }
        .onChange(of: name) {
            userManager.checkNameValid(name)
        }
    }
    
    private func login() {
        userManager.loginUser(name)
    }
}

#Preview {
    LoginView()
}
