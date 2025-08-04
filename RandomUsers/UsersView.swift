//
//  ContentView.swift
//  RandomUsers
//
//  Created by Łukasz Adamczak on 01/08/2025.
//

import SwiftUI

struct UsersView: View {
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            List(userData.users) { user in
                Text(user.fullName)
            }
            .navigationTitle("Random Users")
        }
    }
}

#Preview {
    UsersView()
}
