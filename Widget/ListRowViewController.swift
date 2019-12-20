//
//  ListRowViewController.swift
//  Widget
//
//  Created by Kirill Olenyov on 20.12.2019.
//  Copyright © 2019 Kirill Olenyov. All rights reserved.
//

import Cocoa
import FeedKit

class ListRowViewController: NSViewController {
    
    @IBOutlet weak var ttItem: NSTextField!
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("ListRowViewController")
    }
    
    override func loadView() {
        super.loadView()
        ttItem.addGestureRecognizer(NSClickGestureRecognizer(target: self, action: #selector(ListRowViewController.itemClick)))
    }
    
    override func viewDidAppear() {
        let feedItem = representedObject as! RSSFeedItem
        ttItem.stringValue = feedItem.title ?? ""
    }
    
    @objc func itemClick() {
        let feedItem = representedObject as! RSSFeedItem
        NSWorkspace.shared.open(URL(string: feedItem.link!)!)
    }
    
}
