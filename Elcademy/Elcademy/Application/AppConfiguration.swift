//
//  AppConfiguration.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation

final class AppConfiguration {
    lazy var apiBaseURL: String = {
        return "https://api-rest.elice.io/org/academy/"
    }()
}
