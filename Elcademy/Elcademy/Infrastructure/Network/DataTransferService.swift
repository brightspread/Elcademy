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
    
    typealias GetCoursesList = AnyPublisher<CoursesPage?, NetworkError>
    func getCoursesList(query: CourseQuery) -> GetCoursesList {
        Self.provider.request(target: ElcademyTarget.getCoursesList(query))
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
    
    case getCoursesList(CourseQuery)
    case getCourse
    case getLectureList
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
            default: .requestPlain
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
