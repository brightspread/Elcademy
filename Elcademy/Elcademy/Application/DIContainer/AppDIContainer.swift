//
//  AppDIContainer.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation

final class AppDIContainer {
    lazy var appConfiguration = AppConfiguration()
    
    let apiDataTranserferService = DataTransferService()
    
    func makeHomeSceneDIConatiner() -> HomeSceneDIContainer {
        let dependencies = HomeSceneDIContainer.Dependencies(
            apiDataTransferService: apiDataTranserferService
        )
        return HomeSceneDIContainer(dependencies: dependencies)
    }
}
