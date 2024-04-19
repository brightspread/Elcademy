//
//  CoursesRepositoryProtocol.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation

protocol CoursesRepositoryProtocol {
    func fetchCoursesList(query: CourseListQuery) async -> CoursesListResponse
    func fetchCourse(query: CourseQuery) async -> CourseResponse
    func fetchLectureList(query: LectureListQuery) async -> LecturesListResponse
}
