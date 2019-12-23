//
//  NewsData.swift
//  Widget
//
//  Created by Kirill Olenyov on 22.12.2019.
//  Copyright © 2019 Kirill Olenyov. All rights reserved.
//

import Foundation
import FeedKit

struct Feed: Hashable {
    var title: String
    var date: String
    var link: String
}

class NewsData: ObservableObject {
    @Published var newsData: [Feed]

    public init() {
        newsData = []
    }

}
