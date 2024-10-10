//
//  FirstViewModel.swift
//  Data-Transfer-MVVM
//
//  Created by Murat Tunca on 10.10.2024.
//

import Foundation

class FirstViewModel {
    var selectedUser: User?
    var navigateToSecondView: (() -> Void)?
    
    var users: [User] = [
        User(id: 1, name: "Ahmet", email: "ahmet@example.com"),
        User(id: 2, name: "Mehmet", email: "mehmet@example.com"),
    ]
    
    func didSelectUser(at index: Int) {
        guard index < users.count else { return }
        selectedUser = users[index]
        navigateToSecondView?()
    }
}
