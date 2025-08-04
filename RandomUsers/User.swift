//
//  User.swift
//  RandomUsers
//
//  Created by Łukasz Adamczak on 04/08/2025.
//

import Foundation

struct Response: Decodable {
    let users: [User]
}

struct User: Decodable, Identifiable {
    let id: String
    let name: String
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}
