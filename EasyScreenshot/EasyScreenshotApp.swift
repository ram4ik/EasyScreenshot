//
//  EasyScreenshotApp.swift
//  EasyScreenshot
//
//  Created by Ramill Ibragimov on 07.09.2023.
//

import SwiftUI

@main
struct EasyScreenshotApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
