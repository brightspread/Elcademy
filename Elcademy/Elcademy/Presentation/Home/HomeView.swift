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
                    // FreeCoursesSection
                    CardListSection(
                        sectionTitle: "무료 과목", 
                        courses: viewModel.state.freeCourses,
                        moreCardAction: {
                            viewModel.action(.fetchFreeCoursesList($0))
                        },
                        courseDetails: viewModel.state.coursesDic, 
                        lectures: viewModel.state.lecturesDic
                    )
                    
                    CardListSection(
                        sectionTitle: "추천 과목", 
                        courses: viewModel.state.recommendedCourses,
                        moreCardAction: {
                            viewModel.action(.fetchRecommendedCoursesList($0))
                        },
                        courseDetails: viewModel.state.coursesDic,
                        lectures: viewModel.state.lecturesDic
                    )

                    // MyLecturesSection
    //                CardCourseSection(sectionTitle: "무료 과목", 
    //                                  moreCardAction: { viewModel.action(.fetchCoursesList($0) ) },
    //                                  courses: viewModel.state.coursesList)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        .task {
            viewModel.action(.fetchFreeCoursesList(0))
            viewModel.action(.fetchRecommendedCoursesList(0))
        }
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
