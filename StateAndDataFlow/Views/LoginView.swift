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
    @State private var showAlert = false
    
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
        .alert(isPresented: $userManager.showAlert) {
                    Alert(
                        title: Text("Wrong format!"),
                        message: Text("You can choose any combination of Latin letters (a-z) as a name."),
                        dismissButton: .default(Text("OK"))
                    )
                }
    }
    
    private func login() {
        if !name.isEmpty {
            userManager.loginUser(name)
        }
    }
}

#Preview {
    LoginView()
}
