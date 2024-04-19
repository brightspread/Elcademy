//
//  CardListSectionItem.swift
//  Elcademy
//
//  Created by Leo on 4/19/24.
//

import Foundation

struct CardListSectionItem {
    let title: String
    let courses: [CoursePreview]
    let courseDetails: [Int : Course]
    let lectures: [Int : [Lecture]]
    let moreCardAction: ((Int) -> Void)?
    let registerAction: (Int) -> ()
    let makeCourseDetailView: CourseDetailViewType
}
