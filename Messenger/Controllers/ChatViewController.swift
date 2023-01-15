//
//  ChatViewController.swift
//  Firebase_Messenger
//
//  Created by protech on 1/15/23.
//

import UIKit
import MessageKit

struct modelMessage: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Sender: SenderType {
    var photoURL: String
    var senderId: String
    var displayName: String
}


class ChatViewController: MessagesViewController {
    
    private var messages : [modelMessage] = []
    
    private let selfSender = Sender(photoURL: "",
                                    senderId: "1",
                                    displayName: "Alan Vu")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(modelMessage(sender: selfSender,
                                messageId: "1",
                                sentDate: Date(),
                                kind: .text("Hello World message")))
        
        messages.append(modelMessage(sender: selfSender,
                                messageId: "1",
                                sentDate: Date(),
                                kind: .text("Hello World message, Hello World message, Hello World message, Hello World message")))
        
        view.backgroundColor = .systemCyan
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

    }
}

extension ChatViewController: MessagesDataSource, MessagesDisplayDelegate, MessagesLayoutDelegate {
    var currentSender: SenderType {
        selfSender
    }
    
    func isFromCurrentSender(message: MessageType) -> Bool {
        true
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
