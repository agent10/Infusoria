//
//  SwiftUIView.swift
//  Widget
//
//  Created by Kirill Olenyov on 21.12.2019.
//  Copyright © 2019 Kirill Olenyov. All rights reserved.
//

import SwiftUI
import FeedKit

struct SwiftUIView: View {
    @EnvironmentObject var newsData: NewsData
    
    var body: some View {
        List {
            ForEach(newsData.newsData, id: \.self) { key in
                ListRow(feed: key).onTapGesture {
                    let url = URL(string: key.link)
                    NSWorkspace.shared.open(url!)
                }
            }
        }.background(Color.yellow)
    }
}

struct ListRow: View {
    var feed: Feed
    var body: some View {
        
        VStack {
            Text(feed.title)
            Text(feed.date)
        }
    }
}



//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
