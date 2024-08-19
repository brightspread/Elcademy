//
//  LecturesPage.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import Foundation

struct LecturesListResponse: Codable {
    let result: LectureResult
    let lectures: [Lecture]
    let lectureCount: Int

    enum CodingKeys: String, CodingKey {
        case result = "_result"
        case lectures
        case lectureCount = "lecture_count"
    }
}

struct Lecture: Codable, Hashable {
    let id: Int
    let title, description: String

    enum CodingKeys: String, CodingKey {
        case id
        case title, description
    }
}

struct LectureResult: Codable {
    let status: String
}
