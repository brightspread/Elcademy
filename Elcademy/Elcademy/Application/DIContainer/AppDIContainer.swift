//
//  AppDIContainer.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation

final class AppDIContainer {
    lazy var appConfiguration = AppConfiguration()
    
//    lazy var apiDataTranserferService: DataTransferService = {
//        let config = ApiDataNetworkConfig(
//            baseURL: URL(string: appConfiguration.apiBaseURL)!
//        )
//        let apiDataNetwork = DefaultNetworkService(config: config)
//        return DefaultDataTransferService(networkService: apiDataNetwork)
//    }()
    
    func makeHomeSceneDIConatiner() -> HomeSceneDIContainer {
        let dependencies = HomeSceneDIContainer.Dependencies(
//            apiDataTransferService: apiDataTranserferService
        )
        return HomeSceneDIContainer(dependencies: dependencies)
    }
}
