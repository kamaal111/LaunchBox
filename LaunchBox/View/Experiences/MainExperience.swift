//
//  MainExperience.swift
//  LaunchBox
//
//  Created by Kamaal M Farah on 14/07/2022.
//

import SwiftUI
import SalmonUI

struct MainExperience: View {
    @Environment(\.deviceOrientation) var deviceOrientation
    @Environment(\.deviceType) var deviceType

    var body: some View {
        if deviceType == .iPhone && deviceOrientation == .portrait {
            NavigationStack {
                Text("Select an item")
            }
        } else {
            NavigationSplitView(sidebar: {
                Text("List")
            }) {
                NavigationStack {
                    Text("Select an item")
                }
            }
        }
    }
}

struct MainExperience_Previews: PreviewProvider {
    static var previews: some View {
        MainExperience()
            .withDeviceOrientation()
    }
}
