//
//  ListRowViewController.swift
//  Widget
//
//  Created by Kirill Olenyov on 20.12.2019.
//  Copyright © 2019 Kirill Olenyov. All rights reserved.
//

import Cocoa
import FeedKit
import SwiftUI

class ListRowViewController: NSHostingController<SwiftUIView> {
    
    public init() {
        super.init(rootView: SwiftUIView())
    }
    
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(rootView: SwiftUIView())
    }
    
    @objc required dynamic init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
