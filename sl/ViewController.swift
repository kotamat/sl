//
//  ViewController.swift
//  sl
//
//  Created by 松本 宏太 on 2016/12/03.
//  Copyright © 2016年 松本 宏太. All rights reserved.
//


import Foundation
import AppKit

class ViewController : NSViewController, CAAnimationDelegate {
    let touchBarView = NSView()

    let str = "                         (  ) (@@) ( )  (@)  ()    @@    O     @     O     @      \n" +
    "                    (@@@)\n" +
    "                (    )\n" +
    "             (@@@@)\n" +
    "\n" +
    "           (   )\n" +
    "       ====        ________                ___________                            \n" +
    "   _D _|  |_______/        \\__I_I_____===__|_________|                            \n" +
    "    |(_)---  |   H\\________/ |   |        =|___ ___|      _________________       \n" +
    "    /     |  |   H  |  |     |   |         ||_| |_||     _|                \\_____A\n" +
    "   |      |  |   H  |__--------------------| [___] |   =|                        |\n" +
    "   | ________|___H__/__|_____/[][]~\\_______|       |   -|                        |\n" +
    "   |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|\n" +
    " __/ =| o |=-~O=====O=====O=====O\\ ____Y___________|__|__________________________|\n" +
    "  |/-=|___|=    ||    ||    ||    |_____/~\\___/          |_D__D__D_|  |_D__D__D_| \n" +
    "   \\_/      \\__/  \\__/  \\__/  \\__/      \\_/               \\_/   \\_/    \\_/   \\_/  \n"
    let strSize = 2
    
    override func loadView() {
        self.view = NSView()
    }
    
    override func viewDidAppear() {
        touchBarView.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        touchBarView.layer?.position = CGPoint(x: 0, y: 0)
        
        self.view.addSubview(touchBarView)
        
        touchBarView.addSubview(makeSl())
        
        start()
    }
    
    func makeSl() -> NSView {

        let sl = NSTextView(frame: NSRect(x: 0, y: -15 * strSize, width: strSize * 100, height: 30))
        
        sl.string = str
        sl.setTextColor(NSColor.white, range: NSMakeRange(0, str.characters.count))
        
        sl.drawsBackground = false
        sl.isEditable = false
        sl.isSelectable = false
        sl.font = NSFont.boldSystemFont(ofSize: CGFloat(strSize))
        return sl
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag:Bool){
        NSApplication.shared().terminate(self)
    }
    
    func start() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.repeatCount = 1
        animation.duration = 20
        animation.fromValue = touchBarView.layer?.position
        animation.toValue = NSValue(point: NSPoint(x: -strSize * 100, y: 0))
        animation.delegate = self
        touchBarView.layer?.add(animation, forKey: "position")
    }
}


