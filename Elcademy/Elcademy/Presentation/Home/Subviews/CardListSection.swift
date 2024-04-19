//
//  CardCourseSection.swift
//  Elcademy
//
//  Created by Leo on 4/19/24.
//

import SwiftUI

struct CardListSection: View {
    @State var sectionTitle: String
    
    @State private var scrollPosition: CGPoint = .zero
    @State private var scrollIndex: Int = 0
    
    let courses: [CoursePreview]
    let moreCardAction: (Int) -> Void
    let courseDetails: [Int : Course]
    let lectures: [Int : [Lecture]]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(sectionTitle)
                .font(.system(size: 16).bold())
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(courses, id: \.self) { course in
                        NavigationLink {
                            if let courseDetail = courseDetails[course.id] {
                                CourseDetailView(course: courseDetail, 
                                                 lectures: lectures[course.id])
                            }
                        } label: {
                            Card(course: course)
                        }
                    }
                }
                .background(GeometryReader { geometry in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self,
                                    value: geometry.frame(in: .named("scroll")).origin)
                })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    scrollPosition = value
                    scrollIndex = Int((abs(value.x) + 100) / 200)
                    
                    if scrollIndex == courses.count - 3, !courses.isEmpty {
                        moreCardAction(scrollIndex + 3)
                    }
                }

            }
            .padding(.vertical, 16)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .padding(.leading, 16)
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
