//
//  TodayViewController.swift
//  Widget
//
//  Created by Kirill Olenyov on 20.12.2019.
//  Copyright © 2019 Kirill Olenyov. All rights reserved.
//

import Cocoa
import NotificationCenter
import FeedKit
import SwiftUI
//import AlamofireRSSParser

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

class TodayViewController: NSViewController, NCWidgetProviding {
    
    override func loadView() {
        self.view = NSView()
        self.view.frame = CGRect(x: 0, y: 0, width: 300, height: 150)
        
        preferredContentSize = CGSize(width: 300, height: 150)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = NewsData()
        let a = NSHostingController(rootView: SwiftUIView().environmentObject(data))
        addChild(a)
        a.view.frame = CGRect(x: 0, y: 0, width: 300, height: 150)
        view.addSubview(a.view)
        
        
        let str = "https://news.yandex.ru/index.rss"
        let encodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: encodedStr!)
        let parser = FeedParser(URL: url!)
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            DispatchQueue.main.async {
                data.newsData.removeAll()
                try? result.get().rssFeed?.items?.forEach({ (RSSFeedItem) in
                    data.newsData.append(Feed(title: RSSFeedItem.title ?? "", date: RSSFeedItem.pubDate?.toString(dateFormat: "dd:MM") ?? "",link:RSSFeedItem.link ?? ""))
                })
            }
        }
        
    }
    
    override func dismiss(_ viewController: NSViewController) {
        super.dismiss(viewController)
        
    }
    
    // MARK: - NCWidgetProviding
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Refresh the widget's contents in preparation for a snapshot.
        // Call the completion handler block after the widget's contents have been
        // refreshed. Pass NCUpdateResultNoData to indicate that nothing has changed
        // or NCUpdateResultNewData to indicate that there is new data since the
        // last invocation of this method.
        completionHandler(.noData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInset: NSEdgeInsets) -> NSEdgeInsets {
        // Override the left margin so that the list view is flush with the edge.
        var newInsets = defaultMarginInset
        return defaultMarginInset
    }
    
    var widgetAllowsEditing: Bool {
        // Return true to indicate that the widget supports editing of content and
        // that the list view should be allowed to enter an edit mode.
        return true
    }
    
    func widgetDidBeginEditing() {
        // The user has clicked the edit button.
        // Put the list view into editing mode.
        //        self.listViewController.editing = true
    }
    
    func widgetDidEndEditing() {
        // The user has clicked the Done button, begun editing another widget,
        // or the Notification Center has been closed.
        // Take the list view out of editing mode.
        //        self.listViewController.editing = false
    }
    
}
