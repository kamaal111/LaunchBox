//
//  DeviceOrientation.swift
//  LaunchBox
//
//  Created by Kamaal M Farah on 14/07/2022.
//

import SwiftUI

enum DeviceOrientation {
    case portrait
    case landscape
    case flat
}

extension View {
    func withDeviceOrientation() -> some View {
        self
            .modifier(DeviceOrientationModifier())
    }
}

extension EnvironmentValues {
    var deviceOrientation: DeviceOrientation? {
        get { self[DeviceOrientationKey.self] }
        set { self[DeviceOrientationKey.self] = newValue }
    }
}

private struct DeviceOrientationModifier: ViewModifier {
    @State private var deviceOrientation: DeviceOrientation?

    func body(content: Content) -> some View {
        content
            .environment(\.deviceOrientation, deviceOrientation)
            #if canImport(UIKit)
            .onAppear(perform: { setOrientation() })
            .onReceive(
                NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification),
                perform: { output in setOrientation() })
            #endif
    }

    #if canImport(UIKit)
    private func setOrientation() {
        let lastDeviceOrientaion = deviceOrientation
        switch UIDevice.current.orientation {
        case .portrait:
            deviceOrientation = .portrait
        case .landscapeLeft, .landscapeRight:
            deviceOrientation = .landscape
        case .faceUp, .faceDown:
            deviceOrientation = .portrait
        case .portraitUpsideDown:
            deviceOrientation = lastDeviceOrientaion ?? .portrait
        case .unknown:
            break
        @unknown default:
            break
        }
    }
    #endif
}

private struct DeviceOrientationKey: EnvironmentKey {
    static let defaultValue: DeviceOrientation? = nil
}
