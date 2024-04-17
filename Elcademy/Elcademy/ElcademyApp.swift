//
//  ElcademyApp.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import SwiftUI

@main
struct ElcademyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
