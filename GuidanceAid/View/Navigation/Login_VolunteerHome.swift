//
//  Login_VolunteerHome.swift
//  DearFriend
//
//  Created by Tony Nguyen on 25/11/24.
//

import SwiftUI

struct Login_VolunteerHome: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            if (authViewModel.userSession != nil) {
                VolunteerHome_ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    Login_VolunteerHome()
}
