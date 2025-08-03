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
            VStack {
                Text("Raw JSON Data:")
                ScrollView {
                    Text(userData.users)
                }
            }
            .padding()
            .navigationTitle("Random Users")
        }
    }
}

#Preview {
    UsersView()
}
