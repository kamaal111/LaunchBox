//
//  ContentView.swift
//  LaunchBox
//
//  Created by Kamaal M Farah on 14/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var namiNavigator = NamiNavigator()

    var body: some View {
        MainExperience()
            .environmentObject(namiNavigator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
