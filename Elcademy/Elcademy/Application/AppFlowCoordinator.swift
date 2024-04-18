//
//  AppFlowCoordinator.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation

import SwiftUI

final class AppFlowCoordinator {
    private let appDIContainer: AppDIContainer
    
    init(appDIContainer: AppDIContainer) {
        self.appDIContainer = appDIContainer
    }
    
    @ViewBuilder
    func buildStartView() -> some View {
        let homeSceneDIContainer = appDIContainer.makeHomeSceneDIConatiner()
        homeSceneDIContainer.makeHomeView()
    }
}
