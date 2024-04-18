//
//  CoursesListResponse.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation
// MARK: - CoursesPage
struct CoursesListResponse: Codable {
    let result: CourseResult
    let courses: [CoursePreview]
    let courseCount: Int

    enum CodingKeys: String, CodingKey {
        case result = "_result"
        case courses
        case courseCount = "course_count"
    }
}

//imageFileUrl  // 없으면 logo
//logo_file_url 
//title // 최대 두줄
//shortDescription //최대 두줄
//taglist // 최대 두줄
//isFree
//isRecommended

// MARK: - CoursePreview
struct CoursePreview: Codable {
    let id: Int
    let isRecommended: Bool
    let title, code, shortDescription: String
    let taglist: [String]
    let logoFileURL: String
    let imageFileURL: String?
    let isFree: Bool
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id
        case isRecommended = "is_recommended"
        case title, code
        case shortDescription = "short_description"
        case taglist
        case logoFileURL = "logo_file_url"
        case imageFileURL = "image_file_url"
        case isFree = "is_free"
        case tags
    }
}

// MARK: - Result
struct CourseResult: Codable {
    let status: String
}

// MARK: - Tag
struct Tag: Codable {
    let id, tagType: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case tagType = "tag_type"
        case name
    }
}
