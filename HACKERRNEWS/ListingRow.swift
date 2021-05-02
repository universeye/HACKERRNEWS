//
//  ListingRow.swift
//  HACKERRNEWS
//
//  Created by Terry Kuo on 2021/3/14.
//

import SwiftUI

struct ListingRow: View {
    
    var post = NetWorkManager().posts[0]
    @State var isShow: Bool
    var body: some View {
       // NavigationLink(
        //    destination: SFSafariView(url: URL(string: post.url)!) ,
       //     label: {
                HStack {
                    Text("\(post.points)").bold()
                        .frame(width: 60, height: 60)
                        //.background(Color.gray)
                        .cornerRadius(20)
                    Text(post.title)
                }
                .onTapGesture {
                    isShow.toggle()
                }
                .sheet(isPresented: $isShow, content: {
                    SFSafariView(url: URL(string: post.url)!)
                })
           // }
        //)
    }
}

struct ListingRow_Previews: PreviewProvider {
    static var previews: some View {
        ListingRow(isShow: false)
    }
}
