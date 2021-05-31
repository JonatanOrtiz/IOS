//
//  Model.swift
//  ParsingJson
//
//  Created by Carlos Alberto Savi on 09/03/21.
//

import Foundation

public struct JSONModelElement: Codable {
    public let id: Int?
    public let firstName, lastName, fullName, title, family, imageUrl : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "firstName"
        case lastName = "lastName"
        case fullName = "fullName"
        case title = "title"
        case family = "family"
        case imageUrl = "imageUrl"
    }
}
