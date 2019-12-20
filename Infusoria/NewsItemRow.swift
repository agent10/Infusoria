//
//  NewsItemRow.swift
//  Infusoria
//
//  Created by Kirill Olenyov on 20.12.2019.
//  Copyright © 2019 Kirill Olenyov. All rights reserved.
//

import SwiftUI

struct NewsItemRow: View {
    var newsItem : NewsItem
    
    var body: some View {
        Text(newsItem.title)
    }
}

struct NewsItemRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsItemRow(newsItem: NewsItem(title: "Test"))
            NewsItemRow(newsItem: NewsItem(title: "Test"))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
