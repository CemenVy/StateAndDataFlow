//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Семен Выдрин on 19.10.2023.
//

import SwiftUI

final class StorageManager: ObservableObject {
    
    static let shared = StorageManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func fetchUser() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        guard let user else { return User() }
        return user
    }
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func delete(userManager: UserManager) {
        userManager.user.isLoggedIn = false
        userManager.user.name = ""
        userData = nil
    }
    
}
