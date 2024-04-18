//
//  HomeUseCase.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import Combine

protocol HomeUseCaseProtocol {
    func fetchCourseList(query: CourseListQuery) async -> CoursesListResponse
    func fetchCourse(query: CourseQuery) async -> CourseResponse
    func fetchLectureList(query: LectureListQuery) async -> LecturesListResponse
}

final class HomeUseCase: HomeUseCaseProtocol {    
    private let coursesRepository: CoursesRepositoryProtocol

    init(coursesRepository: CoursesRepositoryProtocol) {
        self.coursesRepository = coursesRepository
    }
    
    func fetchCourseList(query: CourseListQuery) async -> CoursesListResponse {
        await coursesRepository.fetchCoursesList(query: query)
    }
    
    func fetchCourse(query: CourseQuery) async -> CourseResponse {
        await coursesRepository.fetchCourse(query: query)
    }
    
    func fetchLectureList(query: LectureListQuery) async -> LecturesListResponse {
        await coursesRepository.fetchLectureList(query: query)
    }
}

