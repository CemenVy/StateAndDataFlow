//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import Foundation

final class UserManager: ObservableObject {
    @Published var isLoggedIn = false
    var name = ""
}
