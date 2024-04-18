//
//  CoursesRepositoryProtocol.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation

protocol CoursesRepositoryProtocol {
    // 과목 리스트
    func fetchCoursesList(query: CourseListQuery) async -> CoursesListResponse
    // 과목 조회
    func fetchCourse(query: CourseQuery) async -> CourseResponse
    // 수업 리스트
    func fetchLectureList(query: LectureListQuery) async -> LecturesListResponse
}