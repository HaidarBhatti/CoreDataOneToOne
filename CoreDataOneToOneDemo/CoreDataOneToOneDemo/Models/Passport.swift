//
//  Passport.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//

import Foundation

class Passport{
    var id: UUID
    var passportId: String?
    var placeOfIssue: String?
    var name: String?

    init(id: UUID, passportId: String?, placeOfIssue: String?, name: String? = nil){
        self.id = id
        self.passportId = passportId
        self.placeOfIssue = placeOfIssue
        self.name = name
    }
}
