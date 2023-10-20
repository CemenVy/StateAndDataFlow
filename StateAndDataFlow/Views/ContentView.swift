//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(
                action: timer.startTimer,
                title: timer.buttonTitle,
                backgroundColor: .red
            )
            
            Spacer()
           
            ButtonView(
                action: userManager.logoutUser,
                title: "Logout",
                backgroundColor: .blue
            )
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}

struct ButtonView: View {
    var action: () -> Void
    var title: String
    var backgroundColor: Color
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(backgroundColor)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
