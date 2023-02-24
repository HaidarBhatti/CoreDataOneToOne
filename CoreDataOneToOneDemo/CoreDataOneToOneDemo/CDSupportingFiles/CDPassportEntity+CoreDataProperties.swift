//
//  CDPassportEntity+CoreDataProperties.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//
//

import Foundation
import CoreData


extension CDPassportEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPassportEntity> {
        return NSFetchRequest<CDPassportEntity>(entityName: "CDPassportEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var passportId: String?
    @NSManaged public var placeOfIssue: String?
    @NSManaged public var toEmployee: CDEmployeEntity?

}

extension CDPassportEntity : Identifiable {

}
