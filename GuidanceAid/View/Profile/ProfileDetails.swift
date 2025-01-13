//
//  ProfileDetails.swift
//  DearFriend
//
//  Created by Khoa Duong on 24/11/24.
//

import SwiftUI

struct ProfileDetails: View {
    @EnvironmentObject var authViewModel: AuthViewModel
        
    var profileFields: [ProfileField] {
        [
            ProfileField(icon: "person.fill", label: "Full Name", value: authViewModel.currentUser?.name ?? ""),
            ProfileField(icon: "envelope.fill", label: "Email", value: authViewModel.currentUser?.email ?? "")
        ]
    }
    
    var body: some View {
        VStack {
            ForEach(profileFields) { field in
                ProfileFieldView(field: field)
            }
        }
        .listStyle(PlainListStyle())
        .padding(.top, 80)
        .padding(10)
    }
}

#Preview {
    ProfileDetails()
}
