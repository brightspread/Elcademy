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
                    await homeUseCase.execute(query: 
                            .init(offset: 10,
                                  count: 10, 
                                  filterIsRecommended: true,
                                  filterIsFree: true,
                                  filterConditions: [])
                    ).courses
                }
        }
    }
    
    
}
