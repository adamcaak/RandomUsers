//
//  User.swift
//  RandomUsers
//
//  Created by Łukasz Adamczak on 04/08/2025.
//

import Foundation

struct Response {
    let users: [User]
}

struct User: Identifiable {
    let id: String
    let name: String
}

struct Name {
    let title: String
    let first: String
    let last: String
}
