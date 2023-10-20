//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import Foundation
import Combine

final class UserManager: ObservableObject {
    private let storageManager = StorageManager.shared
    
    @Published var user: User
    @Published var isNameValid = false
    
    init() {
        self.user = storageManager.fetchUser() ?? User(name: "", isLoggedIn: false)
    }
    
    func checkNameValid(_ name: String) {
        isNameValid = name.count >= 3
    }
    
    func loginUser(_ name: String) {
        user = User(name: name, isLoggedIn: true)
        storageManager.save(user: user)
    }
    
    func logoutUser() {
        storageManager.deleteUser()
        user = User(name: "", isLoggedIn: false)
        isNameValid = false
    }
    
}
