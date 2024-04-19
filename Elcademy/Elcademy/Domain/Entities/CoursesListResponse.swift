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
struct CoursePreview: Codable, Hashable {
    let id: Int
    let isRecommended: Bool
    let title, code, shortDescription: String
    let description: String?
    let taglist: [String]
    let logoFileURL: String?
    let imageFileURL: String?
    let isFree: Bool
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id
        case isRecommended = "is_recommended"
        case title, code, description
        case shortDescription = "short_description"
        case taglist
        case logoFileURL = "logo_file_url"
        case imageFileURL = "image_file_url"
        case isFree = "is_free"
        case tags
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.isRecommended = try container.decode(Bool.self, forKey: .isRecommended)
        self.title = try container.decode(String.self, forKey: .title)
        self.code = try container.decode(String.self, forKey: .code)
        self.shortDescription = try container.decode(String.self, forKey: .shortDescription)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.taglist = try container.decode([String].self, forKey: .taglist)
        self.logoFileURL = try container.decodeIfPresent(String.self, forKey: .logoFileURL)
        self.imageFileURL = try container.decodeIfPresent(String.self, forKey: .imageFileURL)
        self.isFree = try container.decode(Bool.self, forKey: .isFree)
        self.tags = try container.decode([Tag].self, forKey: .tags)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(isRecommended, forKey: .isRecommended)
        try container.encode(title, forKey: .title)
        try container.encode(code, forKey: .code)
        try container.encode(shortDescription, forKey: .shortDescription)
        try container.encode(description, forKey: .description)
        try container.encode(taglist, forKey: .taglist)
        try container.encode(logoFileURL, forKey: .logoFileURL)
        try container.encode(imageFileURL, forKey: .imageFileURL)
        try container.encode(isFree, forKey: .isFree)
        try container.encode(tags, forKey: .tags)
    }
}

// MARK: - Result
struct CourseResult: Codable {
    let status: String
}

// MARK: - Tag
struct Tag: Codable, Hashable {
    let id, tagType: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case tagType = "tag_type"
        case name
    }
}
