//
//  Message.swift
//  Firebase_Messenger
//
//  Created by protech on 1/10/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var isReceiver: Bool
    var timestamp: Date
}
