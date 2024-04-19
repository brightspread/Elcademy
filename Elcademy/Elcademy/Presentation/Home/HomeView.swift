//
//  HomeView.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import SwiftUI



struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    TopLogoSection()

                    CardListSection(
                        cardListItem: viewModel.buildFreeCoursesSectionItem()
                    )
                    
                    CardListSection(
                        cardListItem: viewModel.buildRecommendedCoursesSectionItem()
                    )
                    
                    CardListSection(
                        cardListItem: viewModel.buildRegisteredCoursesSectionItem()
                    )                
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        .task {
            initializeCourses()
        }
    }
    
    private func initializeCourses() {
        viewModel.action(.fetchFreeCoursesList(0))
        viewModel.action(.fetchRecommendedCoursesList(0))
    }
}

//#Preview {
//    let dataTransferService = DataTransferService()
//    let coursesRepository = CoursesRepository(dataTransferService: dataTransferService)
//    let homeUseCase = HomeUseCase(coursesRepository: coursesRepository)
//    
//    return HomeView(
//        viewModel: .init(
//            homeUseCase:homeUseCase,
//            state: .init()
//        )
//    )
//}
