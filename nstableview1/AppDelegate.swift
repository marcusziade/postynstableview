//
//  AppDelegate.swift
//  nstableview1
//
//  Created by Marcus Ziadé on 12.3.2021.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentViewController = ListViewController()
        window.makeKeyAndOrderFront(nil)
    }
}

