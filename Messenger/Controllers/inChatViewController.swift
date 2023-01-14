//
//  inChatViewController.swift
//  Firebase_Messenger
//
//  Created by protech on 1/12/23.
//

import UIKit
import SwiftUI

class inChatViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    struct ContentView: View {
        @StateObject var messagesManager = MessagesManager()
        
        var body: some View {
            VStack {
                VStack {
                    TitleRow()
                    
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 20)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                }
                .background(Color(UIColor(rgb: 0x87E7FF)))
                
                MessageField()
                    .environmentObject(messagesManager)
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

}
