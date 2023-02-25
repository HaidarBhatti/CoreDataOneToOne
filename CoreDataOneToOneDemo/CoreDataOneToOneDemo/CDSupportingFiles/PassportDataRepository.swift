//
//  PassportDataRepository.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//

import Foundation
import CoreData

protocol PassportRepository: BaseRepository{
    
}

struct PassportDataRepository: PassportRepository{
    
    typealias T = Passport

    func create(record: Passport) {
        let cdPassport = CDPassportEntity(context: PersistantStorage.shared.context)
        PersistantStorage.shared.saveContext()
    }
    
    func getAll() -> [Passport]? {
//        let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDPassportEntity.self)
//        var allEmployees: [Passport] = []
//        result?.forEach({ employee in
//            allEmployees.append(employee.convertToEmployee())
//        })
//        return allEmployees
        return nil
    }
    
    func get(byIdentifier id: UUID) -> Passport? {
//        let result = getCDPassportEntity(byIdentifier: id)
//        guard result != nil else { return nil }
//        return result?.convertToEmployee()
        return nil
    }
    
    func update(record: Passport) -> Bool {
        let adPassport = getCDPassportEntity(byIdentifier: record.id)
        guard adPassport != nil else { return false }
        
        PersistantStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let cdEmployee = getCDPassportEntity(byIdentifier: id)
        guard cdEmployee != nil else { return false }
        PersistantStorage.shared.context.delete(cdEmployee!)
        return true
    }
    
    private func getCDPassportEntity(byIdentifier id: UUID) -> CDPassportEntity?{
        let fetchRequest = NSFetchRequest<CDPassportEntity>(entityName: "CDPassportEntity")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistantStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else { return nil }
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
}
