//
//  DataTransferService.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation
import Combine
import Moya
import Then

final class DataTransferService {
    private static let provider = MoyaProvider<ElcademyTarget>().then {
        $0.session.sessionConfiguration.timeoutIntervalForRequest = 30
    }
    
    typealias GetCoursesList = AnyPublisher<CoursesListResponse?, NetworkError>
    func getCoursesList(query: CourseListQuery) -> GetCoursesList {
        Self.provider.request(target: ElcademyTarget.getCoursesList(query))
    }
    
    typealias GetCourse = AnyPublisher<CourseResponse?, NetworkError>
    func getCourse(query: CourseQuery) -> GetCourse {
        Self.provider.request(target: ElcademyTarget.getCourse(query))
    }

    typealias GetLecturesList = AnyPublisher<LecturesListResponse?, NetworkError>
    func getLecturesList(query: LectureListQuery) -> GetLecturesList {
        Self.provider.request(target: ElcademyTarget.getLectureList(query))
    }
}
