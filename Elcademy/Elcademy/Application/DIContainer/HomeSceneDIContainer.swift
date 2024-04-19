//
//  HomeSceneDiContainer.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import SwiftUI

final class HomeSceneDIContainer: HomeFlowCoordinatorDependencies {

    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeHomeUseCase() -> HomeUseCaseProtocol {
        HomeUseCase(coursesRepository: makeCoursesRepository())
    }
    
    func makeCoursesRepository() -> CoursesRepository {
        CoursesRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    func makeHomeView() -> HomeView {
        HomeView(
            viewModel: .init(
                homeUseCase: self.makeHomeUseCase(), 
                state: .init()
            )
        )
    }
    
    func makeCourseDetailView(with course: Course) -> CourseDetailView {
        CourseDetailView(course: course)
    }
}
