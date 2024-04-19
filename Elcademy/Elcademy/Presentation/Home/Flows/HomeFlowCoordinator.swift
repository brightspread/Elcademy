//
//  HomeFlowCoordinator.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation

typealias CourseDetailViewType = (Course, 
                                  [Lecture]?, 
                                  @escaping () -> ()) -> CourseDetailView

protocol HomeFlowCoordinatorDependencies {
    func makeHomeView() -> HomeView
    func makeCourseDetailView(course: Course, 
                              lectures: [Lecture]?, 
                              registerAction: @escaping () -> ()) -> CourseDetailView
}

final class HomeFlowCoordinator {
    private let dependencies: HomeFlowCoordinatorDependencies
    
    init(dependencies: HomeFlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
}
