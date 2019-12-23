//
//  ListRowViewController.swift
//  Widget
//
//  Created by Kirill Olenyov on 20.12.2019.
//  Copyright © 2019 Kirill Olenyov. All rights reserved.
//

import Cocoa
import NotificationCenter
import FeedKit
import SwiftUI

class ListRowViewController: NSHostingController<SwiftUIView>, NCWidgetProviding {
    
    public init() {
        super.init(rootView: SwiftUIView())
    }
    
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        let v = SwiftUIView()
        super.init(rootView: v)
    }
    
    @objc required dynamic init?(coder: NSCoder) {
        super.init(coder: coder, rootView: SwiftUIView())
    }
    
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
        newInsets.left = 0
        return newInsets
    }
    
    var widgetAllowsEditing: Bool {
        // Return true to indicate that the widget supports editing of content and
        // that the list view should be allowed to enter an edit mode.
        return true
    }
    
    var minimumVisibleRowCount : Int {
        return 10
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
    
    //    @IBOutlet weak var ttItem: NSTextField!
    
    //    override func loadView() {
    //        super.loadView()
    //        ttItem.addGestureRecognizer(NSClickGestureRecognizer(target: self, action: #selector(ListRowViewController.itemClick)))
    //    }
    
    //    override func viewDidAppear() {
    //        let feedItem = representedObject as! RSSFeedItem
    //        ttItem.stringValue = feedItem.title ?? ""
    //    }
    //
    //    @objc func itemClick() {
    //        let feedItem = representedObject as! RSSFeedItem
    //        NSWorkspace.shared.open(URL(string: feedItem.link!)!)
    //    }
    
}
