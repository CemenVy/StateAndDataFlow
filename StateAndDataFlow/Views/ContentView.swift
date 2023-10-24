//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    private let timer = TimeCounter()
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            ButtonView(title: timer.buttonTitle, backgroundColor: .red) {
                timer.startTimer()
            }
            
            Spacer()
            
            ButtonView(title: "Logout", backgroundColor: .blue) {
                storageManager.delete(userManager: userManager)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}

struct ButtonView: View {
    var title: String
    var backgroundColor: Color
    var action: () -> Void
    
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
