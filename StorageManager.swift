//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Семен Выдрин on 19.10.2023.
//

import Foundation

final class StorageManager: ObservableObject {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let userKey = "user"
    
    private init() {}
    
    func fetchUser() -> User? {
        guard let data = userDefaults.data(forKey: userKey) else { return nil }
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            print(user)
            return user
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func save(user: User) {
        guard let data = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(data, forKey: userKey)
    }
    
    func deleteUser() {
        userDefaults.removeObject(forKey: userKey)
    }
    
}
