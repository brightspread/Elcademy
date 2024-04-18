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

enum CoursesList {
    struct Response: Codable {
        
    }
}

enum ElcademyTarget: ElcademyTargetType {
    static let subdomain = URL.Origin.Subdomain.apiRest
    static let domain = URL.Origin.Domain.elice
    static let topLevelDomain = URL.Origin.TopLevelDomain.io
    
    static let urlType = URL.Origin.org
    static let org =  URL.Origin.Org.org
    
    case getCoursesList(CourseListQuery)
    case getCourse(CourseQuery)
    case getLectureList(LectureListQuery)
}

extension ElcademyTarget {    
    var path: String {
        basePath {
            switch self {
                case .getCoursesList:
                    return "academy/course/list/"
                case .getCourse:
                    return "academy/course/get/"
                case .getLectureList:
                    return "academy/lecture/list/"
            }
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .getCoursesList: return .get
            case .getCourse: return .get
            case .getLectureList: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            case .getCoursesList(let model):
                    .requestParameters(parameters: model.toQuery(), 
                                       encoding: URLEncoding.queryString)
            case .getCourse(let model):
                    .requestParameters(parameters: model.toQuery(), 
                                       encoding: URLEncoding.queryString)
            case .getLectureList(let model):
                    .requestParameters(parameters: model.toQuery(), 
                                       encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json",
         "accept": "application/json"]
    }
}

enum NetworkError: Error {
    case unknown(error: Error)
}
