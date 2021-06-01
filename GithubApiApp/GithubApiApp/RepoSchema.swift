//
//  UserSchema.swift
//  GithubApiApp
//
//  Created by Jonatan Eduardo de Araujo on 27/05/21.
//

import Foundation

struct RepoSchema: Codable {
    let name: String
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case name
        case owner
    }
}

struct Owner: Codable {
    let avatar_url: URL
}

typealias Repo = RepoSchema
