//
//  CardCourseSection.swift
//  Elcademy
//
//  Created by Leo on 4/19/24.
//

import SwiftUI

struct CardListSection: View {
    
    let cardListItem: CardListSectionItem
    
    @State private var scrollPosition: CGPoint = .zero
    @State private var scrollIndex: Int = 0
    
    private let INDEX_MORE_CARD_ACTION = 3
    
    var body: some View {
        let sectionTitle = cardListItem.title
        let courses = cardListItem.courses
        let courseDetails = cardListItem.courseDetails
        let lectures = cardListItem.lectures
        let registerAction = cardListItem.registerAction
        let makeCourseDetailView = cardListItem.makeCourseDetailView
        let moreCardAction = cardListItem.moreCardAction
        
        VStack(alignment: .leading, spacing: 0) {
            Text(sectionTitle)
                .font(.system(size: 16).bold())
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(courses, id: \.self) { course in
                        NavigationLink {
                            if let courseDetail = courseDetails[course.id] {
                                makeCourseDetailView(
                                    courseDetail,
                                    lectures[course.id]
                                ) { 
                                    registerAction(course.id)
                                }
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
                    
                    if scrollIndex == courses.count - INDEX_MORE_CARD_ACTION,
                       !courses.isEmpty {
                        moreCardAction?(scrollIndex + INDEX_MORE_CARD_ACTION)
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
