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
        Text("HomeView")
            .task {
               
                viewModel.action(.fetchCoursesList)
            }
    }
    
}

