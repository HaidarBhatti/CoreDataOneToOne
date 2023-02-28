//
//  CDEmployeeExtension.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//

import Foundation
import CoreData

extension CDEmployeEntity {
    
    func convertToEmployee() -> Employee{
        return Employee(id: self.id!,
                        email: self.email!,
                        name: self.name!,
                        profilePic: self.profilePic!,
                        passport: self.toPassport?.convertToPassport())
    }
    
}

