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
    
    init() {
        self.user = storageManager.fetchUser() ?? User(name: "", isLoggedIn: false)
    }
    
}
