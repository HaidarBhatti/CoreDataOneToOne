//
//  Employee.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//

import Foundation

class Employee{
    var id: UUID
    var email: String
    var name: String
    var profilePic: Data
    var passport: Passport?
    
    init(id: UUID, email: String, name: String, profilePic: Data, passport: Passport? = nil){
        self.id = id
        self.email = email
        self.name = name
        self.profilePic = profilePic
        self.passport = passport
    }
}
