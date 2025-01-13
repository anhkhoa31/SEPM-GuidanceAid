//
//  SplashScreen.swift
//  DearFriend
//
//  Created by Khoa Duong on 19/11/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showLogInFailMessage = false
    @State private var isPasswordVisible = false
    
    @State private var isShowStartView = false // Add this state variable

        var body: some View {
            NavigationView {
                VStack {
                    Spacer().frame(height: 50)
                    HStack {
                        NavigationLink(
                            destination: StartView(isShowStartView: $isShowStartView),
                            isActive: $isShowStartView
                        ) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .padding()
                        }
                        Spacer()
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                    }
                    .padding(.top, 0)
                    .padding(.horizontal)
                
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        TextField("Enter your email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                    

                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        if isPasswordVisible {
                            TextField("Enter your password", text: $password)
                        } else {
                            SecureField("Enter your password", text: $password)
                        }
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                    HStack {
                        Spacer()
                        Button(action: {
                            // Forgot password action
                        }) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Button {
                        Task {
                            do {
                                try await viewModel.signIn(withEmail: email, password: password)
                            } catch {
                                showLogInFailMessage = true
                                print("Sign in failed: \(error.localizedDescription)")
                            }
                        }
                    } label: {
                        Text("Login")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.blue.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .padding(.top, 0)
                    
                    // Error Message
                    Text(showLogInFailMessage == true ? "Incorrect email or password" : "")
                        .font(.callout)
                        .foregroundColor(.red)
                        .padding(.top, 0)
                    
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.gray)
                        NavigationLink {
                            Registration()
                        } label: {
                            Text("Sign Up")
                                .foregroundColor(.blue)
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.top, 0)
                    
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.3))
                        Text("OR")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                    .padding(.vertical, 20)
                    
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    Image("group")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.bottom, 32)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}


struct SocialLoginButton: View {
    var image: String
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Button(action: {
        }) {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 10)
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title3)
                    .padding(.vertical, 5)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 55)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
        .padding(.horizontal)
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}

#Preview {
    LoginView()
}
