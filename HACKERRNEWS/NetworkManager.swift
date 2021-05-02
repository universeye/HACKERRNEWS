//
//  NetworkManager.swift
//  HACKERRNEWS
//
//  Created by Terry Kuo on 2021/3/11.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetWorkManager: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var isLoading = true
    
    func fetchData() {
        let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
        
        AF.request(url).responseJSON { [weak self] (response) in
            guard let self = self else { return }
            if let json = response.data {
                Array(1...20).forEach { n in
                    if let finalResults = self.parseJson(json, index: n) {
                        
                        self.posts.append(finalResults)
                        print("Final Results = \(finalResults)")
                    }
                }
                //DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isLoading = false
                //}
                
                print("success getting data")
                //print("Self.posts = \(self.posts)")
            }
        }
    }
    
    
    func parseJson(_ data: Data, index: Int) -> Post? {
        do {
            let json = try JSON(data: data)
            if let title = json["hits"][index]["title"].string,
               let objectID = json["hits"][index]["objectID"].string,
               let url = json["hits"][index]["url"].string,
               let points = json["hits"][index]["points"].int
            {
                
                let item = Post(objectID: objectID, title: title, url: url, points: points)
                
               return item
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    
}
