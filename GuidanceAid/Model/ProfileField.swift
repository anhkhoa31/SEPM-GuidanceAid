//
//  ProfileField.swift
//  DearFriend
//
//  Created by Tony Nguyen on 17/11/24.
//

import Foundation

struct ProfileField: Identifiable {
    let id = UUID()
    let icon: String
    let label: String
    var value: String
}
