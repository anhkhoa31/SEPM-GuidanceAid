//
//  ContentView.swift
//  DearFriend
//
//  Created by Khai Nguyen on 17/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StartView_VIMainSelection()
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
