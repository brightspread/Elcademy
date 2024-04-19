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
    
    init(offset: Int? = nil, 
         count: Int? = nil,
         filterIsRecommended: Bool? = nil,
         filterIsFree: Bool? = nil,
         filterConditions: [String]? = nil) {
        self.offset = offset
        self.count = count
        self.filterIsRecommended = filterIsRecommended
        self.filterIsFree = filterIsFree
        self.filterConditions = filterConditions
    }
    
    func toQuery() -> [String: Any] {
        
        var query: [String: Any] = [:]
        
        
        if let filterIsRecommended {
            query.updateValue(filterIsRecommended ? "true" : "false", forKey: "filter_is_recommended")
        }
        
        if let filterIsFree {
            query.updateValue(filterIsFree ? "true" : "false", forKey: "filter_is_free")
        }     
        
        if let filterConditions, !filterConditions.isEmpty {
            query.updateValue(filterConditions, forKey: "filter_conditions")
        }            
        
        if let offset {
            query.updateValue(offset, forKey: "offset")
        }
        
        if let count {
            query.updateValue(count, forKey: "count")
        }

        return query
    }
}
