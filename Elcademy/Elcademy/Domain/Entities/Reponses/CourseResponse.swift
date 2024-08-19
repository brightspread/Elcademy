//
//  CourseResponse.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import Foundation

struct CourseResponse: Codable {
    let result: CourseResponseResult
    let course: Course

    enum CodingKeys: String, CodingKey {
        case result = "_result"
        case course
    }
}

struct Course: Codable {
    let id: Int
    let title, code: String
    let shortDescription: String?
    let description: String?
    let imageFileURL, logoFileURL: String?
    let isFree: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case title, code, description
        case shortDescription = "short_description"
        case imageFileURL = "image_file_url"
        case logoFileURL = "logo_file_url"
        case isFree = "is_free"
    }
}

struct CourseResponseResult: Codable {
    let status: String
}
