//
//  CourseQuery.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import Foundation

struct CourseQuery: Equatable {
    let courseId: Int
    
    func toQuery() -> [String: Any] {
        var query: [String: Any] = [:]
        query.updateValue(courseId, forKey: "course_id")
        return query
    }
}
