//
//  LectureListQuery.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import Foundation

struct LectureListQuery: Equatable {
    let offset: Int?
    let count: Int?
    let courseId: Int
    
    func toQuery() -> [String: Any] {
        
        var query: [String: Any] = [:]
        
        query.updateValue(courseId, forKey: "course_id")
        
        if let offset {
            query.updateValue(offset, forKey: "offset")
        }
        
        if let count {
            query.updateValue(count, forKey: "count")
        }
    
        return query
    }
}
