//
//  ElcademyTarget.swift
//  Elcademy
//
//  Created by Leo on 4/19/24.
//

import Foundation
import Moya

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
