//
//  CourseDetailView.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import SwiftUI
import MarkdownUI

struct CourseDetailView: View {
    let course: Course
    let lectures: [Lecture]?
    let registerAction: () -> ()
    
    @Environment(\.dismiss) var dismiss
    @AppStorage("registeredCourses") private var registeredCourses: [CoursePreview] = []
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                CourseTopSection(title: course.title,
                                 description: course.shortDescription,
                                 imageFileURL: course.imageFileURL)
                
                image
                
                if let description = course.description,
                   !description.isEmpty {
                    CourseDescriptionSection(description: description)
                }
                
                if let lectures, 
                    !lectures.isEmpty {
                    CourseLecturesSection(lectures: lectures)
                }
                
                Spacer()
                    .frame(height: 40)
            }
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .bottom) {
            lectureActionButton
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

fileprivate extension CourseDetailView {
    @ViewBuilder
    var image: some View {
        if let urlString = course.imageFileURL {
            AsyncImage(url: URL(string: urlString)) {
                $0.image?.resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
        }
    }
    
    @ViewBuilder
    var lectureActionButton: some View {
        let isRegistered = registeredCourses.contains {
            $0.id == course.id
        }
        Button {
            registerAction()
            dismiss()
        } label: {
            Text(isRegistered ? "수강 취소" : "수강 신청")
                .font(.system(size: 16).bold())
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(isRegistered ? Color(hexString: "F44336") : Color(hexString: "5A2ECC"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 16)
        }
    }
    
    var backButton : some View {
        Button{
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.black)
            }
        }
    }
}
