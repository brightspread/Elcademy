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
    
}

//MARK: Actions
extension HomeViewModel {
    func action(_ action: HomeViewAction) {
        switch action {
            case .fetchFreeCoursesList(let offset):
                Task {
                    let courses = await homeUseCase.fetchCourseList(query: 
                            .init(offset: offset,
                                  count: FETCH_COUNT_PER_CALL, 
                                  filterIsFree: true)
                    ).courses
                    await updateFreeCourseData(offset, courses)
                    buildCoursesDic(from: courses)
                }
            case .fetchRecommendedCoursesList(let offset):
                Task {
                    let courses = await homeUseCase.fetchCourseList(query: 
                            .init(offset: offset,
                                  count: FETCH_COUNT_PER_CALL, 
                                  filterIsRecommended: true)
                    ).courses
                    await updateRecommendedCourseData(offset, courses)
                    buildCoursesDic(from: courses)
                }
            case .fetchCourse(let id):
                Task {
                    let course = await homeUseCase.fetchCourse(
                        query: .init(courseId: id)
                    ).course
                    await updateCourseDic(id, course)
                }

            case .fetchLecturesList(let id):
                Task {
                    let lectures = await homeUseCase.fetchLectureList(query: 
                            .init(
                                offset: 0, 
                                count: FETCH_COUNT_PER_CALL,
                                courseId: id
                            )
                    ).lectures
                    await updateLectureDic(id, lectures)
                }                
            case .registerCourse(let id):
                let isRegistered = registeredCourses.contains(where: { $0.id == id })

                if isRegistered {
                    unregisterCourse(id)
                } else {
                    registerCourse(id)
                }
        }
    }
}

// MARK: Update Data
fileprivate extension HomeViewModel {    
    @MainActor
    func updateFreeCourseData(_ offset: Int, _ courses: [CoursePreview]) {
        withAnimation {
            state.freeCoursesDic[offset] = courses
            state.freeCourses = buildCoursesList(from: state.freeCoursesDic)
        }
    }
    
    @MainActor
    func updateRecommendedCourseData(_ offset: Int, _ courses: [CoursePreview]) {
        withAnimation {
            state.recommendedCoursesDic[offset] = courses
            state.recommendedCourses = buildCoursesList(from: state.recommendedCoursesDic)
        }
    }
    
    @MainActor
    func updateCourseDic(_ id: Int, _ course: Course) {
        if state.coursesDic[id] == nil {
            state.coursesDic[id] = course
        }
    }
    
    @MainActor
    func updateLectureDic(_ id: Int, _ lectures: [Lecture]) {
        if state.lecturesDic[id] == nil {
            state.lecturesDic[id] = lectures
        }
    }
    
    func unregisterCourse(_ id: Int) {
        registeredCourses.removeAll { 
            $0.id == id
        }
    }
    
    func registerCourse(_ id: Int) {
        let course = (state.freeCourses + state.recommendedCourses)
            .filter { $0.id == id }
            .first
        if let course {
            registeredCourses.append(course)
        } 
    }
}


// MARK: Build data
extension HomeViewModel {
    func buildFreeCoursesSectionItem() -> CardListSectionItem {
        CardListSectionItem(                 
            title: "무료 과목", 
            courses: state.freeCourses,
            courseDetails: state.coursesDic, 
            lectures: state.lecturesDic,
            moreCardAction: { [weak self] in
                self?.action(.fetchFreeCoursesList($0))
            },
            registerAction: { [weak self] in
                self?.action(.registerCourse($0))
            }, 
            makeCourseDetailView: makeCourseDetailView
        )
    }
    
    func buildRecommendedCoursesSectionItem() -> CardListSectionItem {
        CardListSectionItem(                 
            title: "추천 과목", 
            courses: state.recommendedCourses,
            courseDetails: state.coursesDic,
            lectures: state.lecturesDic,
            moreCardAction: {[weak self] in
                self?.action(.fetchRecommendedCoursesList($0))
            },
            registerAction: {[weak self] in
                self?.action(.registerCourse($0))
            },
            makeCourseDetailView: makeCourseDetailView
        )
    }
    
    func buildRegisteredCoursesSectionItem() -> CardListSectionItem {
        CardListSectionItem(                 
            title: "내 학습", 
            courses: registeredCourses,
            courseDetails: state.coursesDic,
            lectures: state.lecturesDic, 
            moreCardAction: nil,
            registerAction: {[weak self] in
                self?.action(.registerCourse($0))
            },
            makeCourseDetailView: makeCourseDetailView
        )
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
    
    fileprivate func buildCoursesDic(from courses: [CoursePreview]) {
        courses.forEach { course in
            Task {
                action(.fetchCourse(course.id))
                action(.fetchLecturesList(course.id))
            }
        }
    }
}
