//
//  CourseListQuery.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation

struct CourseListQuery: Equatable {
    let offset: Int?
    let count: Int?
    let filterIsRecommended: Bool?
    let filterIsFree: Bool?
    let filterConditions: [String]?
    
    func toQuery() -> [String: Any] {
        
        var query: [String: Any] = [:]
        
        if let offset {
            query.updateValue(offset, forKey: "offset")
        }
        
        if let count {
            query.updateValue(count, forKey: "count")
        }
        
        if let filterIsRecommended {
            query.updateValue(filterIsRecommended, forKey: "filter_is_recommended")
        }
        
        if let filterIsFree {
            query.updateValue(filterIsFree, forKey: "offilter_is_freefset")
        }     
        
        if let filterConditions, !filterConditions.isEmpty {
            query.updateValue(filterConditions, forKey: "filter_conditions")
        }            
        return query
    }
}
