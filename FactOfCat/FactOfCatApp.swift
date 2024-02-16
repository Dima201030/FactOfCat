//
//  FactOfCatApp.swift
//  FactOfCat
//
//  Created by Дима Кожемякин on 16.02.2024.
//

import SwiftUI

@main
struct FactOfCatApp: App {
    @StateObject var factOfCat = FactOfCat()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FactOfCat())
        }
    }
}
