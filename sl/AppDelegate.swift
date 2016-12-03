//
//  AppDelegate.swift
//  sl
//
//  Created by 松本 宏太 on 2016/12/03.
//  Copyright © 2016年 松本 宏太. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarItemIdentifier {
    static let sl = NSTouchBarItemIdentifier("net.kotamat.sl")
}

@available(OSX 10.12.1, *)
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTouchBarProvider, NSTouchBarDelegate {
    
    var touchBar: NSTouchBar?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        self.touchBar = makeTouchBar()
    }
    
    
    func makeTouchBar() -> NSTouchBar {
        let mainBar = NSTouchBar()
        mainBar.delegate = self
        mainBar.defaultItemIdentifiers = [.sl]
        return mainBar
    }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        if identifier == .sl {
            let item = NSCustomTouchBarItem(identifier: identifier)
            item.viewController = ViewController()
            return item
        } else {
            return nil
        }
    }
    
    @objc
    func tapped(_ sender : NSObject) {
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

