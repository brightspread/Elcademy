//
//  CoursesPage.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation
// MARK: - CoursesPage
struct CoursesPage: Codable {
    let result: Result
    let courses: [Course]
    let courseCount: Int

    enum CodingKeys: String, CodingKey {
        case result = "_result"
        case courses
        case courseCount = "course_count"
    }
}

// MARK: - Course
struct Course: Codable {
    let id: Int
    let isRecommended, isChatRoomDisabled, isPostStudentInfoVisible, isPostStudentEmailEnabled: Bool
    let isPostTutorEmailEnabled: Bool
    let preference: Preference
    let enrollBeginDatetime: Int
    let enrollEndDatetime, releaseDatetime: Int?
    let beginDatetime: Int
    let endDatetime: Int?
    let completeDatetime: JSONNull?
    let enrolledRolePeriod: Int?
    let brushupInfo: JSONNull?
    let enrollType: Int
    let subscriptionLevel: Int?
    let enrollLimitNumber: JSONNull?
    let price, priceUsd: String
    let unit: Int?
    let discountedPrice, discountedPriceUsd: String
    let discountBeginDatetime, discountEndDatetime: Int?
    let discountTitle, discountRate: String?
    let completionInfo: CompletionInfo
    let courseType: Int
    let infoSummaryVisibilityDict: InfoSummaryVisibilityDict
    let isExerciseDeprecated: Bool
    let lastCourseInfoID: Int
    let title, code, shortDescription: String
    let classTimes: [JSONAny]
    let classType: Int
    let taglist: [String]
    let promoteVideoURL: JSONNull?
    let logoFileURL: String
    let imageFileURL: String?
    let period, version: Int
    let isDiscounted: Bool
    let attendInfo: AttendInfo
    let lastAttendUpdatedDate: JSONNull?
    let leaderboardRankingType: Int
    let leaderboardInfo: LeaderboardInfo
    let isFree: Bool
    let status: Int
    let libraryAccessType: JSONNull?
    let libraryCredit: Double?
    let libraryType: Int
    let isEnrollNotiEnabled, isDatetimeEnrollable: Bool
    let agreementInfo: AgreementInfo
    let isEnrollGuestEnabled, isLegacyTest: Bool
    let lastReviewStatus: Int
    let courseAgreedDatetime: JSONNull?
    let courseRole: Int
    let hasPastCourseRole: Bool
    let ern: String
    let aibotInfo: AibotInfo
    let prerequisiteCourseIDS: [JSONAny]
    let enrolledUserCount, enrolledStudentCount, normalLectureCount, testLectureCount: Int
    let normalLecturePageCount: Int
    let isLibraryMaterialInstanceExist, isLibraryMaterialInstanceSyncEnabled: Bool
    let enrolledRoleBeginDatetime, enrolledRoleEndDatetime, enrolledRoleBrushupBeginDatetime, enrolledRoleBrushupEndDatetime: JSONNull?
    let lecturePageReadInfo: JSONNull?
    let tags: [Tag]
    let tracks: [Track]
    let instructors: [JSONAny]
    let testLecture: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case isRecommended = "is_recommended"
        case isChatRoomDisabled = "is_chat_room_disabled"
        case isPostStudentInfoVisible = "is_post_student_info_visible"
        case isPostStudentEmailEnabled = "is_post_student_email_enabled"
        case isPostTutorEmailEnabled = "is_post_tutor_email_enabled"
        case preference
        case enrollBeginDatetime = "enroll_begin_datetime"
        case enrollEndDatetime = "enroll_end_datetime"
        case releaseDatetime = "release_datetime"
        case beginDatetime = "begin_datetime"
        case endDatetime = "end_datetime"
        case completeDatetime = "complete_datetime"
        case enrolledRolePeriod = "enrolled_role_period"
        case brushupInfo = "brushup_info"
        case enrollType = "enroll_type"
        case subscriptionLevel = "subscription_level"
        case enrollLimitNumber = "enroll_limit_number"
        case price
        case priceUsd = "price_usd"
        case unit
        case discountedPrice = "discounted_price"
        case discountedPriceUsd = "discounted_price_usd"
        case discountBeginDatetime = "discount_begin_datetime"
        case discountEndDatetime = "discount_end_datetime"
        case discountTitle = "discount_title"
        case discountRate = "discount_rate"
        case completionInfo = "completion_info"
        case courseType = "course_type"
        case infoSummaryVisibilityDict = "info_summary_visibility_dict"
        case isExerciseDeprecated = "is_exercise_deprecated"
        case lastCourseInfoID = "last_course_info_id"
        case title, code
        case shortDescription = "short_description"
        case classTimes = "class_times"
        case classType = "class_type"
        case taglist
        case promoteVideoURL = "promote_video_url"
        case logoFileURL = "logo_file_url"
        case imageFileURL = "image_file_url"
        case period, version
        case isDiscounted = "is_discounted"
        case attendInfo = "attend_info"
        case lastAttendUpdatedDate = "last_attend_updated_date"
        case leaderboardRankingType = "leaderboard_ranking_type"
        case leaderboardInfo = "leaderboard_info"
        case isFree = "is_free"
        case status
        case libraryAccessType = "library_access_type"
        case libraryCredit = "library_credit"
        case libraryType = "library_type"
        case isEnrollNotiEnabled = "is_enroll_noti_enabled"
        case isDatetimeEnrollable = "is_datetime_enrollable"
        case agreementInfo = "agreement_info"
        case isEnrollGuestEnabled = "is_enroll_guest_enabled"
        case isLegacyTest = "is_legacy_test"
        case lastReviewStatus = "last_review_status"
        case courseAgreedDatetime = "course_agreed_datetime"
        case courseRole = "course_role"
        case hasPastCourseRole = "has_past_course_role"
        case ern
        case aibotInfo = "aibot_info"
        case prerequisiteCourseIDS = "prerequisite_course_ids"
        case enrolledUserCount = "enrolled_user_count"
        case enrolledStudentCount = "enrolled_student_count"
        case normalLectureCount = "normal_lecture_count"
        case testLectureCount = "test_lecture_count"
        case normalLecturePageCount = "normal_lecture_page_count"
        case isLibraryMaterialInstanceExist = "is_library_material_instance_exist"
        case isLibraryMaterialInstanceSyncEnabled = "is_library_material_instance_sync_enabled"
        case enrolledRoleBeginDatetime = "enrolled_role_begin_datetime"
        case enrolledRoleEndDatetime = "enrolled_role_end_datetime"
        case enrolledRoleBrushupBeginDatetime = "enrolled_role_brushup_begin_datetime"
        case enrolledRoleBrushupEndDatetime = "enrolled_role_brushup_end_datetime"
        case lecturePageReadInfo = "lecture_page_read_info"
        case tags, tracks, instructors
        case testLecture = "test_lecture"
    }
}

// MARK: - AgreementInfo
struct AgreementInfo: Codable {
    let title: String
    let isEnabled: Bool
    let description: String

    enum CodingKeys: String, CodingKey {
        case title
        case isEnabled = "is_enabled"
        case description
    }
}

// MARK: - AibotInfo
struct AibotInfo: Codable {
    let isEnabled: Bool

    enum CodingKeys: String, CodingKey {
        case isEnabled = "is_enabled"
    }
}

// MARK: - AttendInfo
struct AttendInfo: Codable {
    let isEnabled: Bool
    let activeEndDate, activeBeginDate: String
    let checkInEndTime, checkOutEndTime: CheckEndTime
    let checkInBeginTime, checkOutBeginTime: CheckBeginTime
    let requiredStaySeconds: Int

    enum CodingKeys: String, CodingKey {
        case isEnabled = "is_enabled"
        case activeEndDate = "active_end_date"
        case activeBeginDate = "active_begin_date"
        case checkInEndTime = "check_in_end_time"
        case checkOutEndTime = "check_out_end_time"
        case checkInBeginTime = "check_in_begin_time"
        case checkOutBeginTime = "check_out_begin_time"
        case requiredStaySeconds = "required_stay_seconds"
    }
}

enum CheckBeginTime: String, Codable {
    case the0000 = "00:00"
}

enum CheckEndTime: String, Codable {
    case the2400 = "24:00"
}

// MARK: - CompletionInfo
struct CompletionInfo: Codable {
    let unit: Unit
    let condition: Condition
}

// MARK: - Condition
struct Condition: Codable {
    let score, progress: Int
    let isEnabled: Bool

    enum CodingKeys: String, CodingKey {
        case score, progress
        case isEnabled = "is_enabled"
    }
}

// MARK: - Unit
struct Unit: Codable {
    let value: Int
    let isEnabled: Bool

    enum CodingKeys: String, CodingKey {
        case value
        case isEnabled = "is_enabled"
    }
}

// MARK: - InfoSummaryVisibilityDict
struct InfoSummaryVisibilityDict: Codable {
    let level, period, classType, classTimes: Bool
    let completionUnit, exercisePageCount, completionCondition, programmingLanguage: Bool
    let totalVideoDuration, enrolledStudentCount, lecturePageAccessPeriod: Bool

    enum CodingKeys: String, CodingKey {
        case level, period
        case classType = "class_type"
        case classTimes = "class_times"
        case completionUnit = "completion_unit"
        case exercisePageCount = "exercise_page_count"
        case completionCondition = "completion_condition"
        case programmingLanguage = "programming_language"
        case totalVideoDuration = "total_video_duration"
        case enrolledStudentCount = "enrolled_student_count"
        case lecturePageAccessPeriod = "lecture_page_access_period"
    }
}

// MARK: - LeaderboardInfo
struct LeaderboardInfo: Codable {
    let entryType, scoreType, rankingType: Int
    let scoreRatio, submitCountLimit, scoreOpenDatetime: JSONNull?

    enum CodingKeys: String, CodingKey {
        case entryType = "entry_type"
        case scoreType = "score_type"
        case rankingType = "ranking_type"
        case scoreRatio = "score_ratio"
        case submitCountLimit = "submit_count_limit"
        case scoreOpenDatetime = "score_open_datetime"
    }
}

// MARK: - Preference
class Preference: Codable {
    let boards, images, manage, configs: Bool?
    let members, lectures, requests, sections: Bool?
    let tutoring, dashboard, libraries, attendance: Bool?
    let leaderboard, lectureroom, aiDashboard, attendanceAdmin: Bool?
    let sectionSchedule: Bool?
    let tabMenusVisibility: Preference?
    let landing: Landing?
    let renderMarkdownInQuizOptions, chatting, helpcenter, liveStreaming: Bool?
    let info: Bool?

    enum CodingKeys: String, CodingKey {
        case boards, images, manage, configs, members, lectures, requests, sections, tutoring, dashboard, libraries, attendance, leaderboard, lectureroom
        case aiDashboard = "ai_dashboard"
        case attendanceAdmin = "attendance_admin"
        case sectionSchedule = "section_schedule"
        case tabMenusVisibility = "tab_menus_visibility"
        case landing
        case renderMarkdownInQuizOptions = "render_markdown_in_quiz_options"
        case chatting, helpcenter
        case liveStreaming = "live_streaming"
        case info
    }

    init(boards: Bool?, images: Bool?, manage: Bool?, configs: Bool?, members: Bool?, lectures: Bool?, requests: Bool?, sections: Bool?, tutoring: Bool?, dashboard: Bool?, libraries: Bool?, attendance: Bool?, leaderboard: Bool?, lectureroom: Bool?, aiDashboard: Bool?, attendanceAdmin: Bool?, sectionSchedule: Bool?, tabMenusVisibility: Preference?, landing: Landing?, renderMarkdownInQuizOptions: Bool?, chatting: Bool?, helpcenter: Bool?, liveStreaming: Bool?, info: Bool?) {
        self.boards = boards
        self.images = images
        self.manage = manage
        self.configs = configs
        self.members = members
        self.lectures = lectures
        self.requests = requests
        self.sections = sections
        self.tutoring = tutoring
        self.dashboard = dashboard
        self.libraries = libraries
        self.attendance = attendance
        self.leaderboard = leaderboard
        self.lectureroom = lectureroom
        self.aiDashboard = aiDashboard
        self.attendanceAdmin = attendanceAdmin
        self.sectionSchedule = sectionSchedule
        self.tabMenusVisibility = tabMenusVisibility
        self.landing = landing
        self.renderMarkdownInQuizOptions = renderMarkdownInQuizOptions
        self.chatting = chatting
        self.helpcenter = helpcenter
        self.liveStreaming = liveStreaming
        self.info = info
    }
}

// MARK: - Landing
struct Landing: Codable {
    let mode: String
    let configsV2: ConfigsV2?

    enum CodingKeys: String, CodingKey {
        case mode
        case configsV2 = "configs_v2"
    }
}

// MARK: - ConfigsV2
struct ConfigsV2: Codable {
    let bgColor: String
    let sections: [Section]
    let titleColor, adBannerLink, promotionType: String
    let coverImageURL: String
    let adBannerImageURL, shortDescriptionColor: String

    enum CodingKeys: String, CodingKey {
        case bgColor = "bg_color"
        case sections
        case titleColor = "title_color"
        case adBannerLink = "ad_banner_link"
        case promotionType = "promotion_type"
        case coverImageURL = "cover_image_url"
        case adBannerImageURL = "ad_banner_image_url"
        case shortDescriptionColor = "short_description_color"
    }
}

// MARK: - Section
struct Section: Codable {
    let type, uuid: String
    let payload: Payload
}

// MARK: - Payload
struct Payload: Codable {
    let cards: [Card]?
    let label, title: String
    let visible: Bool
    let alignMode: String?
    let description: String
    let anchorEnabled: Bool
    let objectives: [Objective]?
    let fileURL: String?

    enum CodingKeys: String, CodingKey {
        case cards, label, title, visible
        case alignMode = "align_mode"
        case description
        case anchorEnabled = "anchor_enabled"
        case objectives
        case fileURL = "file_url"
    }
}

// MARK: - Card
struct Card: Codable {
    let title, description: String
    let caption: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case title, description, caption
        case imageURL = "image_url"
    }
}

// MARK: - Objective
struct Objective: Codable {
    let title: String
    let description: String?
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

// MARK: - Track
struct Track: Codable {
    let id: Int
    let title: String
}

// MARK: - Result
struct Result: Codable {
    let status: String
    let reason: JSONNull?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
