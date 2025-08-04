//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Łukasz Adamczak on 02/08/2025.
//

import Foundation

struct UserFetchingClient {
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    static func getUsers() async throws -> [User] {
        async let (data, _) = await URLSession.shared.data(from: url)
        let response =  try await JSONDecoder().decode(Response.self, from: data)
        return response.users
    }
}

@MainActor
class UserData: ObservableObject {
    @Published var users: [User] = []
    
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
