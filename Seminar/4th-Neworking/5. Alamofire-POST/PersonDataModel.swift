//
//  PersonDataModel.swift
//  Seminar-4th-review
//
//  Created by mindyeoi on 2021/05/14.
//

import Foundation

// MARK: - Empty
struct PersonDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Person
}

// MARK: - DataClass
struct Person: Codable {
    let name, profileMessage: String

    enum CodingKeys: String, CodingKey {
        case name
        case profileMessage = "profile_message"
    }
}
