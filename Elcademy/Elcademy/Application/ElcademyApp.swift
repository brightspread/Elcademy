//
//  ElcademyApp.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import SwiftUI

@main
struct ElcademyApp: App {
    let appDIContainer = AppDIContainer()
    var appFlowCoordinator: AppFlowCoordinator?
    let persistenceController = PersistenceController.shared
    
    init() {
        appFlowCoordinator = AppFlowCoordinator(appDIContainer: appDIContainer)
    }

    var body: some Scene {
        return WindowGroup {
            appFlowCoordinator?.buildStartView()
        }
    }
}
