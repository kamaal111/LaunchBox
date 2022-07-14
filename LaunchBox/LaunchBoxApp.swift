//
//  LaunchBoxApp.swift
//  LaunchBox
//
//  Created by Kamaal M Farah on 14/07/2022.
//

import SwiftUI

@main
struct LaunchBoxApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                #if os(macOS)
                .frame(minWidth: Constants.UI.mainViewMinimumSize.width, minHeight: Constants.UI.mainViewMinimumSize.height)
                #endif
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .withDeviceOrientation()
        }
    }
}
