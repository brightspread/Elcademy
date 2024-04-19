//
//  HomeFlowCoordinator.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation

protocol HomeFlowCoordinatorDependencies {
    func makeHomeView() -> HomeView
    func makeCourseDetailView(with course: Course) -> CourseDetailView
}

final class HomeFlowCoordinator {
    private let dependencies: HomeFlowCoordinatorDependencies
    
    init(dependencies: HomeFlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
}
