//
//  SplashScreen.swift
//  DearFriend
//
//  Created by Khoa Duong on 01/12/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var currentPage = 0
    @State private var navigateToStartView = false
    @State private var isShowStartView = true
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    var body: some View {
        if navigateToStartView {
            StartView(isShowStartView: $isShowStartView)
        } else {
            VStack {
                TabView(selection: $currentPage) {
                    SplashScreenPage(
                        imageName: "cube.fill",
                        title: "Object + Text Detection",
                        description: "Get ready to explore the world like never before.",
                        buttonText: "Skip",
                        buttonAction: {
                            currentPage = 1
                        }
                    )
                    .tag(0)

                    SplashScreenPage(
                        imageName: "network",
                        title: "IP Tracking",
                        description: "Keep track of your family member.",
                        buttonText: "Skip",
                        buttonAction: {
                            currentPage = 2
                        }
                    )
                    .tag(1)

                    
                    SplashScreenPage(
                        imageName: "video.fill",
                        title: "Volunteer Aid",
                        description: "Always available for your requirements.",
                        buttonText: "Start",
                        buttonAction: {
                            hasSeenOnboarding = true
                            navigateToStartView = true
                        }
                    )
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())

                
                HStack(spacing: 8) {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(index == currentPage ? Color.green : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}

struct SplashScreenPage: View {
    let imageName: String
    let title: String
    let description: String
    let buttonText: String
    let buttonAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.black)

            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Spacer()

            
            Button(action: buttonAction) {
                Text(buttonText)
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    SplashScreen()
}
