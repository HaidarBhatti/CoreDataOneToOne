//
//  CDPassportExtension.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//

import Foundation
import CoreData

extension CDPassportEntity {

    func convertToPassport() -> Passport{
        return Passport(id: self.id!,
                        passportId: self.passportId!,
                        placeOfIssue: self.placeOfIssue!,
                        name: (self.toEmployee?.name)!)
    }
    
}
