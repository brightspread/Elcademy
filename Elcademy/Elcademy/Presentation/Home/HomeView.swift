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
        ScrollView {
            VStack(spacing: 0) {
                // TopLogoSection
                TopLogoSection()
                // FreeCoursesSection
                // RecommendedCoursesSection
                // MyLecturesSection
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    let dataTransferService = DataTransferService()
    let coursesRepository = CoursesRepository(dataTransferService: dataTransferService)
    let homeUseCase = HomeUseCase(coursesRepository: coursesRepository)
    
    return HomeView(
        viewModel: .init(
            homeUseCase:homeUseCase,
            state: .init()
        )
    )
}
