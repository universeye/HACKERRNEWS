//
//  PostData.swift
//  HACKERRNEWS
//
//  Created by Terry Kuo on 2021/3/11.
//

import Foundation

struct Post: Identifiable {
    var id = UUID()
    var objectID: String
    var title: String
    var url: String
    var points: Int
}
