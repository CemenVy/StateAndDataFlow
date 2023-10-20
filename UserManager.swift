//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import Foundation

final class UserManager: ObservableObject {
    private let storageManager = StorageManager.shared
    
    @Published var user: User
    @Published var showAlert = false
    
    init() {
        self.user = storageManager.fetchUser() ?? User(name: "", isLoggedIn: false)
    }
    
    func loginUser(_ name: String) {
        let characterSet = CharacterSet.letters
        guard name.rangeOfCharacter(from: characterSet.inverted) == nil else {
            showAlert = true
            print(false)
            return
        }
        
        user = User(name: name, isLoggedIn: true)
        storageManager.save(user: user)
    }
    
    func logoutUser() {
        storageManager.deleteUser()
        user = User(name: "", isLoggedIn: false)
    }
    
}
