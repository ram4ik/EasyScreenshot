//
//  ScreenCaptureUtil.swift
//  EasyScreenshot
//
//  Created by Ramill Ibragimov on 07.09.2023.
//

import SwiftUI

    enum ScreenshotType {
        case EntireScreen
        case Window
        case UserSelection
}

class ScreenCaptureUtil {
    
    static func screenshot(type: ScreenshotType) {
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        
        switch type {
        case .EntireScreen:
            task.arguments = ["-cm"]
        case .Window:
            task.arguments = ["-cw"]
        case .UserSelection:
            task.arguments = ["-cs"]
            
        }
        
        task.launch()
        task.waitUntilExit()
        
    }
}
