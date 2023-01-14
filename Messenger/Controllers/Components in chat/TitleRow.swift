//
//  TitleRow.swift
//  Firebase_Messenger
//
//  Created by protech on 1/10/23.
//

import SwiftUI

struct TitleRow: View {
    var imageURL = URL(string: "https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/289150973_5759762457367684_319123445678011263_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=_Gu-gPIAYX4AX-5S10S&_nc_oc=AQn-staARpyMYxZdVwMcSHyf5xQ5_V2OxJtfHtWJPmwApfzF9qZ0ls_jBr1zBwWWLAw&_nc_ht=scontent.fhan5-8.fna&oh=00_AfAtbNesLFHrbzUvmpfbXMjiXw18MPvDIsBG6Z-GmNop4Q&oe=63C2A234")
    var name = "Thỏ Bảy Màu"
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(70)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
            
        }
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color(UIColor(rgb: 0x60E4FF)))
    }
}
