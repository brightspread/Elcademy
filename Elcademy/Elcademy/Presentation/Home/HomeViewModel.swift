//
//  HomeViewModel.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import SwiftUI
import Combine

struct HomeViewState {
    fileprivate(set) var coursesList: [CoursePreview] = []
    fileprivate(set) var coursesOffsetDic: [Int : [CoursePreview]] = [:]
    
    fileprivate(set) var freeCourses: [CoursePreview] = []
    fileprivate(set) var freeCoursesDic: [Int : [CoursePreview]] = [:]

    fileprivate(set) var recommendedCourses: [CoursePreview] = []
    fileprivate(set) var recommendedCoursesDic: [Int : [CoursePreview]] = [:]
    
    fileprivate(set) var coursesDic: [Int : Course] = [:]
}

enum HomeViewAction {
    case fetchFreeCoursesList(Int)
    case fetchRecommendedCoursesList(Int)
    case fetchCourse(Int)
    case fetchLecturesList
}

final class HomeViewModel: ViewModel {
    private let homeUseCase: HomeUseCaseProtocol
    
    @Published var state: HomeViewState
    
    private var coursesLoadTask: Cancellable? {
        willSet {
            coursesLoadTask?.cancel()
        }
    }
    
    init(homeUseCase: HomeUseCaseProtocol,
         state: HomeViewState) {
        self.homeUseCase = homeUseCase
        self.state = state
        
        action(.fetchFreeCoursesList(0))
        action(.fetchRecommendedCoursesList(0))
    }
    
    fileprivate func buildCoursesList(from dic: [Int : [CoursePreview]]) -> [CoursePreview] {
        var list: [CoursePreview] = []
        for i in 0..<dic.count {
            if let courses = dic[i * 10] {
                list.append(contentsOf: courses)
            }
        }
        return list
    }
    
    private func buildCoursesDic(from courses: [CoursePreview]) {
        courses.forEach { [weak self] in
            self?.action(.fetchCourse($0.id))
        }
    }
    
    func action(_ action: HomeViewAction) {
        switch action {
            case .fetchFreeCoursesList(let offset):
                Task {
                    let courses = await homeUseCase.fetchCourseList(query: 
                            .init(offset: offset,
                                  count: 10, 
                                  filterIsRecommended: nil, 
                                  filterIsFree: true,
                                  filterConditions: [])
                    ).courses
                    
                    Task { @MainActor in
                        state.freeCoursesDic[offset] = courses
                        state.freeCourses = buildCoursesList(from: state.freeCoursesDic)
                    }
                    
                    buildCoursesDic(from: courses)
                }
            case .fetchRecommendedCoursesList(let offset):
                Task {
                    let courses = await homeUseCase.fetchCourseList(query: 
                            .init(offset: offset,
                                  count: 10, 
                                  filterIsRecommended: true, 
                                  filterIsFree: nil,
                                  filterConditions: [])
                    ).courses
                    
                    Task { @MainActor in
                        state.recommendedCoursesDic[offset] = courses
                        state.recommendedCourses = buildCoursesList(from: state.recommendedCoursesDic)
                    }
                }
            case .fetchCourse(let id):
                Task {
                    let course = await homeUseCase.fetchCourse(query: 
                            .init(courseId: id)
                    ).course
                    
                    Task { @MainActor [weak self] in 
                        guard let self = self else { return }
                        if state.coursesDic[id] == nil {
                            state.coursesDic[id] = course
                        }
                    }
                }
            case .fetchLecturesList:
                Task {
                    let lectures = await homeUseCase.fetchLectureList(query: 
                            .init(offset: 0, 
                                  count: 10,
                                  courseId: 18817
                                 )
                    ).lectures
                    
                    lectures.forEach {
                        print("lecture : \($0.title)")
                    }
                }
                
        }
    }
    
    
}
