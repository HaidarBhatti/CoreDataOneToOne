//
//  CDEmployeEntity+CoreDataProperties.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//
//

import Foundation
import CoreData


extension CDEmployeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployeEntity> {
        return NSFetchRequest<CDEmployeEntity>(entityName: "CDEmployeEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var profilePic: Data?
    @NSManaged public var toPassport: CDPassportEntity?

}

extension CDEmployeEntity : Identifiable {

}
