//
//  NewsListView.swift
//  Infusoria
//
//  Created by Kirill Olenyov on 20.12.2019.
//  Copyright © 2019 Kirill Olenyov. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    var body: some View {
        List() {
            NewsItemRow(newsItem: NewsItem(title:"Test1"))
            NewsItemRow(newsItem: NewsItem(title:"Test2"))
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
