//
//  SplashScreen.swift
//  DearFriend
//
//  Created by Khoa Duong on 24/11/24.
//

import SwiftUI

struct ProfileView: View {

    @EnvironmentObject var authViewModel: AuthViewModel
    @Binding var isShowProfileView: Bool
    @State private var navigateToHome = false // State for navigation

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                VStack {
                    Color.green
                        .frame(height: 150)
                        .overlay(
                            VStack {
                                ZStack {
                                    Image("profile")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color.white, lineWidth: 4)
                                        )
                                }
                            }
                        )
                }

                VStack {
                    List {
                        ProfileRow(icon: "person.fill", title: "Full name", value: "GUIDANCE")
                        ProfileRow(icon: "person.2.fill", title: "Username", value: "SGS - RMIT GROUP 5")
                        ProfileRow(icon: "calendar", title: "Date of birth", value: "24/01/2004")
                        ProfileRow(icon: "figure.stand", title: "Gender", value: "Male")
                        ProfileRow(icon: "globe", title: "Nationality", value: "Vietnam")
                        ProfileRow(icon: "phone.fill", title: "Phone number", value: "0999999999")
                        ProfileRow(icon: "envelope.fill", title: "Email", value: "rmitGroup11@rmit.edu.vn")
                    }
                    .listStyle(.insetGrouped)
                    .frame(maxHeight: .infinity)
                }
                .background(Color(red: 247/255, green: 245/255, blue: 255/255))

                HStack {
                    Spacer()
                    
                    // NavigationLink for Home Button
                    NavigationLink(destination: VIMainSelectionView(isShowStartView: .constant(false)), isActive: $navigateToHome) {
                        Button(action: {
                            navigateToHome = true
                        }) {
                            Image(systemName: "house.fill")
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "location.fill")
                            .frame(maxWidth: .infinity)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "person.fill")
                            .frame(maxWidth: .infinity)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
            }
            .navigationBarTitle("Personal Information", displayMode: .inline)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ProfileRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            Text(title)
                .font(.body)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    ProfileView(isShowProfileView: .constant(true))
        .environmentObject(AuthViewModel())
}
