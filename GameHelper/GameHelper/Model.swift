//
//  Model.swift
//  GameHelper
//
//  Created by Jonatan Eduardo de Araujo on 09/03/21.
//

import Foundation

public struct JSONModelElement: Codable {
    public let id: Int?
    public let firstName, lastName, fullName, idade, soco_01, soco_02, soco_03, chute_01, chute_02, chute_03, image : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "firstName"
        case lastName = "lastName"
        case fullName = "fullName"
        case idade = "idade"
        case soco_01 = "soco_01"
        case soco_02 = "soco_02"
        case soco_03 = "soco_03"
        case chute_01 = "chute_01"
        case chute_02 = "chute_02"
        case chute_03 = "chute_03"
        case image = "image"
    }
}
