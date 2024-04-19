//
//  HomeViewModel.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import SwiftUI
import Combine

struct HomeViewState {
    fileprivate(set) var freeCourses: [CoursePreview] = []
    fileprivate(set) var freeCoursesDic: [Int : [CoursePreview]] = [:]

    fileprivate(set) var recommendedCourses: [CoursePreview] = []
    fileprivate(set) var recommendedCoursesDic: [Int : [CoursePreview]] = [:]
    
    fileprivate(set) var coursesDic: [Int : Course] = [:]
    fileprivate(set) var lecturesDic: [Int : [Lecture]] = [:]
    
    fileprivate(set) var registeredCourseIds: Set<Int> = []
    fileprivate(set) var registeredCourses: [CoursePreview] = []
}

enum HomeViewAction {
    case fetchFreeCoursesList(Int)
    case fetchRecommendedCoursesList(Int)
    case fetchCourse(Int)
    case fetchLecturesList(Int)
    case registerCourse(Int)
}

final class HomeViewModel: ViewModel {
    private let homeUseCase: HomeUseCaseProtocol
    
    @Published fileprivate(set) var state: HomeViewState
    @AppStorage("registeredCourses") fileprivate(set) var registeredCourses: [CoursePreview] = []
    
    let makeCourseDetailView: CourseDetailViewType
    
    private let FETCH_COUNT_PER_CALL = 10
    
    init(homeUseCase: HomeUseCaseProtocol,
         state: HomeViewState,
         makeCourseDetailView: @escaping CourseDetailViewType
    ) {
        self.homeUseCase = homeUseCase
        self.state = state
        self.makeCourseDetailView = makeCourseDetailView
    }
    
    fileprivate func buildCoursesList(from dic: [Int : [CoursePreview]]) -> [CoursePreview] {
        var list: [CoursePreview] = []
        for i in 0..<dic.count {
            if let courses = dic[i * FETCH_COUNT_PER_CALL] {
                list.append(contentsOf: courses)
            }
        }
        return list
    }
    
    private func buildCoursesDic(from courses: [CoursePreview]) {
        courses.forEach { course in
            Task {
                action(.fetchCourse(course.id))
                action(.fetchLecturesList(course.id))
            }
        }
    }
    
    @MainActor
    func updateFreeCourseData(offset: Int, courses: [CoursePreview]) {
        withAnimation {
            state.freeCoursesDic[offset] = courses
            state.freeCourses = buildCoursesList(from: state.freeCoursesDic)
        }
    }
    
    func action(_ action: HomeViewAction) {
        switch action {
            case .fetchFreeCoursesList(let offset):
                Task {
                    let courses = await homeUseCase.fetchCourseList(query: 
                            .init(offset: offset,
                                  count: FETCH_COUNT_PER_CALL, 
                                  filterIsRecommended: nil, 
                                  filterIsFree: true,
                                  filterConditions: [])
                    ).courses
                    await updateFreeCourseData(offset: offset, courses: courses)
                    buildCoursesDic(from: courses)
                }
            case .fetchRecommendedCoursesList(let offset):
                Task {
                    let courses = await homeUseCase.fetchCourseList(query: 
                            .init(offset: offset,
                                  count: FETCH_COUNT_PER_CALL, 
                                  filterIsRecommended: true, 
                                  filterIsFree: nil,
                                  filterConditions: [])
                    ).courses
                    
                    Task { @MainActor in
                        state.recommendedCoursesDic[offset] = courses
                        state.recommendedCourses = buildCoursesList(from: state.recommendedCoursesDic)
                    }
                    
                    buildCoursesDic(from: courses)
                }
            case .fetchCourse(let id):
                Task {
                    let course = await homeUseCase.fetchCourse(
                        query: 
                            .init(courseId: id)
                    ).course
                    
                    Task { @MainActor [weak self] in 
                        guard let self = self else { return }
                        if state.coursesDic[id] == nil {
                            state.coursesDic[id] = course
                        }
                    }
                }
            case .fetchLecturesList(let id):
                Task {
                    let lectures = await homeUseCase.fetchLectureList(query: 
                            .init(offset: 0, 
                                  count: FETCH_COUNT_PER_CALL,
                                  courseId: id
                                 )
                    ).lectures
                    
                    Task { @MainActor [weak self] in 
                        guard let self = self else { return }
                        if state.lecturesDic[id] == nil {
                            state.lecturesDic[id] = lectures
                        }
                    }
                }                
            case .registerCourse(let id):
                if registeredCourses.contains(where: { $0.id == id }) {
                    registeredCourses.removeAll { 
                        $0.id == id
                    }
                } else {
                    let course = (state.freeCourses + state.recommendedCourses)
                        .filter { $0.id == id }
                        .first
                    if let course {
                        registeredCourses.append(course)
                    } 
                }
        }
    }
    
    
}
