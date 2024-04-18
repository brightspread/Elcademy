//
//  HomeViewModel.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import SwiftUI
import Combine

struct HomeViewState {
    
}

enum HomeViewAction {
    case fetchCoursesList
    case fetchCourse
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
    }
    
    func action(_ action: HomeViewAction) {
        switch action {
            case .fetchCoursesList: 
                Task {
                    let courses = await homeUseCase.fetchCourseList(query: 
                            .init(offset: 10,
                                  count: 10, 
                                  filterIsRecommended: true,
                                  filterIsFree: true,
                                  filterConditions: [])
                    ).courses
                    
                    courses.forEach {
                        print("course : \($0.title)")
                    }
                }
            case .fetchCourse:
                Task {
                    let course = await homeUseCase.fetchCourse(query: 
                            .init(courseId: 18817)
                    ).course
                    
//                    print(course)
                }
            case .fetchLecturesList:
                Task {
                    let lectures = await homeUseCase.fetchLectureList(query: 
                            .init(offset: 0, 
                                  count: 40,
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
