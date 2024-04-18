//
//  HomeUseCase.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import Combine

protocol HomeUseCaseProtocol {
    func execute(query: CourseQuery) async -> CoursesPage
}

final class HomeUseCase: HomeUseCaseProtocol {
    private let coursesRepository: CoursesRepositoryProtocol

    init(coursesRepository: CoursesRepositoryProtocol) {
        self.coursesRepository = coursesRepository
    }
    
    func execute(query: CourseQuery) async -> CoursesPage {
        await coursesRepository.fetchCoursesList(query: query)
    }
}

