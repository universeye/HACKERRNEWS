//
//  ListingRow.swift
//  HACKERRNEWS
//
//  Created by Terry Kuo on 2021/3/14.
//

import SwiftUI

struct ListingRow: View {
    
    var post = NetWorkManager().posts[0]
    
    var body: some View {
        NavigationLink(
            destination: DetailView(url: post.url) ,
            label: {
                HStack {
                    Text("\(post.points)").bold()
                        .frame(width: 60, height: 60)
                        //.background(Color.gray)
                        .cornerRadius(20)
                    Text(post.title)
                }
            })
    }
}

struct ListingRow_Previews: PreviewProvider {
    static var previews: some View {
        ListingRow()
    }
}
