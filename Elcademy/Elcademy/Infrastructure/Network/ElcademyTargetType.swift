//
//  ElcademyTargetType.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation
import Combine
import Moya
import CombineMoya
import Then

protocol ElcademyTargetType: TargetType {
    static var urlType: URL.Origin { get }
    static var subdomain: URL.Origin.Subdomain { get }
    static var domain: URL.Origin.Domain { get }
    static var topLevelDomain: URL.Origin.TopLevelDomain { get }
    static var org: URL.Origin.Org { get }
}

extension ElcademyTargetType {
    var baseURL: URL {
        URLComponents().with {
            $0.scheme = Self.urlType.scheme
            $0.host = [
                Self.subdomain.rawValue,
                Self.domain.rawValue,
                Self.topLevelDomain.rawValue
            ].joined(separator: ".")

        }.url!
    }
    
    func basePath(postfix: () -> String?) -> String {
        [Self.urlType.rawValue]
            .filter { !$0.isEmpty }
            .with {
                if let post = postfix() {
                    $0.append(post)
                }
            }.joined(separator: "/")
    }
}

extension URL {
    enum Origin: String {
        case base = ""
        case org
    }
}

extension URL.Origin {
    enum Subdomain: String {
        case apiRest = "api-rest"
    }

    enum Domain: String {
        case elice
    }
    
    enum TopLevelDomain: String {
        case io
    }

    enum Org: String {
        case org = "org"
    }

    var scheme: String {
        "https"
    }
}
