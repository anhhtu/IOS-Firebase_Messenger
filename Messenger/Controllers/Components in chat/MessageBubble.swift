//
//  MessageBubble.swift
//  Firebase_Messenger
//
//  Created by protech on 1/10/23.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.isReceiver ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.isReceiver ? Color(UIColor(rgb: 0xEAEAEA)) : Color(UIColor(rgb: 0x87E7FF)))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.isReceiver ? .leading : .trailing)
            .onTapGesture { showTime.toggle() }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.isReceiver ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth:.infinity, alignment: message.isReceiver ? .leading : .trailing)
        .padding(message.isReceiver ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "000", text: "Some text for preview! Read this carefully or being an idiot !!", isReceiver: true, timestamp: Date()))
    }
}
