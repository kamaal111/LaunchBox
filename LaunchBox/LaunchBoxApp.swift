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
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
