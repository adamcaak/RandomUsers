//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Łukasz Adamczak on 02/08/2025.
//

import Foundation

struct UserFetchingClient {
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    static func getUsers() async throws -> String {
        async let (data, _) = await URLSession.shared.data(from: url)
        return try await String(data: data, encoding: .utf8)!
    }
}

class UserData: ObservableObject {
    @Published var users: String = ""
    
    init() {
        Task {
            await loadUsers()
        }
        
        func loadUsers() async {
            do {
                let user = try await UserFetchingClient.getUsers()
                self.users = user
            }
            catch {
                print(error)
            }
        }
    }
}
