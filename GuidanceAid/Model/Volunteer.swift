//
//  Volunteer.swift
//  DearFriend
//
//  Created by Tony Nguyen on 22/12/24.
//

import Foundation

struct Volunteer:Identifiable,Codable{
    let id: String
    let name: String
    let email: String?
    var imageURL: URL?
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
    init(id: String, name: String, email: String? = nil, imageURL: URL? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.imageURL = imageURL
    }
}

