//
//  DatabaseManager.swift
//  Firebase_Messenger
//
//  Created by protech on 1/14/23.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
}

//MARK: - Account Management
extension DatabaseManager {
    
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        database.child(email).observeSingleEvent(of: .value, with: {snapshot in
            guard snapshot.value as? String != nil else {
            completion(false)
                return
            }
            
            completion(true)
        })
    }
    
    /// Insert new user to database
    public func insertUser(with user: ChatAppUser) {
        database.child(user.email).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName,
            "phone": user.phone
        ])
    }
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
//        let profilePictureUrl: String
}

