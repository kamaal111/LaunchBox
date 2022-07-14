//
//  DeviceType.swift
//  LaunchBox
//
//  Created by Kamaal M Farah on 14/07/2022.
//

import SwiftUI

enum DeviceType {
    case iPhone
    case iPad
    case mac
}

extension EnvironmentValues {
    var deviceType: DeviceType {
        get { self[DeviceTypeKey.self] }
        set { self[DeviceTypeKey.self] = newValue }
    }
}

private struct DeviceTypeKey: EnvironmentKey {
    static let defaultValue: DeviceType = {
        #if canImport(UIKit)
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .iPad
        }
        return .iPhone
        #else
        return .mac
        #endif
    }()
}
