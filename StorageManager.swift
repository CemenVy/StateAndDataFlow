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
    
    func fetchUser() -> User? {
        guard let data = userData else { return nil }
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            return user
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func save(user: User) {
        guard let data = try? JSONEncoder().encode(user) else { return }
        userData = data
    }
    
    func deleteUser() {
        userData = nil
    }
    
}
