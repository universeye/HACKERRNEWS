//
//  DetailView.swift
//  HACKERRNEWS
//
//  Created by Terry Kuo on 2021/3/12.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    @State var isLoading = true
    @State private var isSharing = false
    
    var body: some View {
        
        ZStack {
            VStack {
                WebView(urlString: url)
                    .frame(maxWidth: .infinity, maxHeight: 700)
                HStack {
                    Link(destination: URL(string: url!)!, label: {
                        Image(systemName: "safari")
                    }) //Open With Safari
                    
                    Button(action: shareAction , label: {
                        Image(systemName: "square.and.arrow.up")
                    }) //Share
                    
                }
            }
            
            
            if isLoading == true {
                ZStack {
                    Color(.black).ignoresSafeArea()
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                isLoading = false
            }
        })
    }
    
    
    func shareAction() {
        isSharing.toggle()
        
        if let url1 = url {
            if let shareURL = URL (string: url1) {
                let av = UIActivityViewController(activityItems: [shareURL], applicationActivities: nil)
                
                UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "")
    }
}
