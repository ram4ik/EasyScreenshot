//
//  AppDelegate.swift
//  EasyScreenshot
//
//  Created by Ramill Ibragimov on 07.09.2023.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        
        if let statusBarButton = statusBarItem?.button {
            statusBarButton.image = NSImage(systemSymbolName: "cursorarrow.rays", accessibilityDescription: nil)
        }
        
        let mainMenu = NSMenu()
        
        let itemSelectArea = NSMenuItem(title: "Select an area", action: #selector(Self.actionSelectArea(_:)), keyEquivalent: "")
        itemSelectArea.image = NSImage(systemSymbolName: "rectangle.dashed", accessibilityDescription: nil)
        itemSelectArea.target = self
        mainMenu.addItem(itemSelectArea)
        
        let itemCaptureEntireScreen = NSMenuItem(title: "Screenshot the entire screen", action: #selector(Self.actionCaptureEntireScreen(_:)), keyEquivalent: "")
        itemCaptureEntireScreen.image = NSImage( systemSymbolName: "macwindow.on.rectangle", accessibilityDescription: nil)
        itemCaptureEntireScreen.target = self
        mainMenu.addItem(itemCaptureEntireScreen)
        
        let itemCaptureWindow = NSMenuItem(title: "Capture a window", action: #selector(self.actionCaptureWindow(_:)), keyEquivalent: "")
        itemCaptureWindow.image = NSImage( systemSymbolName: "macwindow", accessibilityDescription: nil)
        itemCaptureWindow.target = self
        
        mainMenu.addItem(itemCaptureWindow)
        
        mainMenu.addItem(.separator())
        
        let itemQuit = NSMenuItem(title: "Quit EasyScreenshot", action: #selector(self.actionExitApp(_:)), keyEquivalent: "")
        itemQuit.target = self
        mainMenu.addItem(itemQuit)
        statusBarItem?.menu = mainMenu
    }

    @objc private func actionExitApp(_ sender: Any?) {
        NSApp.terminate(self)
    }

    @objc private func actionCaptureEntireScreen(_ sender: Any?) {
        ScreenCaptureUtil.screenshot(type: .EntireScreen)
    }

    @objc private func actionSelectArea(_ sender: Any?) {
        ScreenCaptureUtil.screenshot(type: .UserSelection)
    }

    @objc private func actionCaptureWindow(_ sender: Any?) {
        ScreenCaptureUtil.screenshot(type: .Window)
    }
    
}
