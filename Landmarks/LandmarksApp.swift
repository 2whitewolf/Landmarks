//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Bogdan Sevcenco on 27.06.2022.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData )
        }
    }
}
