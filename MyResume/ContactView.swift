//
//  ContactView.swift
//  MyResume
//
//  Created by TBCASoft-Bennett on 2022/8/1.
//

import SwiftUI

struct ContactView: View {
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "phone.fill")
                    .resizable().aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.brown))
                    .padding(10)
                ForEach(Resume.shared.socialMedia, id: \.name) { media in
                    Image(media.name.lowercased())
                        .resizable().aspectRatio(contentMode: .fit)
                        .padding(10)
                }
            }
            
            Text("取消")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
        .padding()
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
            .background(.yellow)
    }
}
