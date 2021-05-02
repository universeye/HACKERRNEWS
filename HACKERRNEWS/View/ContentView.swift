//
//  ContentView.swift
//  HACKERRNEWS
//
//  Created by Terry Kuo on 2021/3/11.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var networkManager = NetWorkManager()
    
    
    var body: some View {
        NavigationView {
            ZStack {
                List(networkManager.posts) { post in
                    ListingRow(post: post, isShow: false)
                    
                } //List
                
                .listStyle(PlainListStyle())
                .navigationBarTitle("HACKERRNEWS")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button("Help") {
                            print("Help tapped!")
                        } //Help button
                        .disabled(true)
                        .redacted(reason: networkManager.isLoading ? .placeholder : [])
                        
                        NavigationLink(
                            destination: BookmarkedView() ,
                            label: {
                                Image(systemName: "bookmark")
                            })
                            .disabled(true)
                    } //ToolbarItemGroup
                }  //.toolbar
                .navigationBarItems(trailing:
                                        Button(action: {
                                            networkManager.posts = []
                                            networkManager.isLoading = true
                                            networkManager.fetchData()
                                        }, label: {
                                            Image(systemName: "goforward")
                                        }) // Refresh Button
                                        .disabled(networkManager.isLoading) //when isLoading is true, disable the buttun
                ) //.navigationBarItems
                .redacted(reason: networkManager.isLoading ? .placeholder : [])
                
                if networkManager.isLoading {
                    loadingView()
                }
            } //ZStack
        } //NavigationView
        //.environment(\.colorScheme, .dark) //darkMode
        .onAppear(perform: {
            networkManager.fetchData()
        })
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct loadingView: View {
    var body: some View {
        VStack {
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1)
            
            Text("Loading...")
                .opacity(0.8)
                .padding(.top, 5)
        }
    }
}
