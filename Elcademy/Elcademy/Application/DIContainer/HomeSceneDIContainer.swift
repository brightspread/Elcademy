//
//  HomeSceneDiContainer.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import SwiftUI

final class HomeSceneDIContainer: HomeFlowCoordinatorDependencies {

    struct Dependencies {
//        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeHomeView() -> HomeView {
        HomeView()
    }
    
    func makeCourseDetailView() -> CourseDetailView {
        CourseDetailView()
    }
}
