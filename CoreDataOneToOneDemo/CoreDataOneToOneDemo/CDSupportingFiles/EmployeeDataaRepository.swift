//
//  EmployeeDataaRepository.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//

import Foundation
import CoreData

protocol EmployeeRepository: BaseRepository{
    
}

struct EmployeeDataRepository: EmployeeRepository{
    
    typealias T = Employee
    
    func create(record: Employee) {
        let employee = CDEmployeEntity(context: PersistantStorage.shared.context)
        employee.id = record.id
        employee.email = record.email
        employee.profilePic = record.profilePic
        employee.name = record.name
        if record.passport != nil{
            let passport = CDPassportEntity(context: PersistantStorage.shared.context)
            passport.id = record.passport?.id
            passport.passportId = record.passport?.passportId
            passport.placeOfIssue = record.passport?.placeOfIssue
            employee.toPassport = passport
        }
        PersistantStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        guard let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDEmployeEntity.self) else { return nil }
        var allEmployees: [Employee] = []
        
        result.forEach { cdEmployeEntity in
            allEmployees.append(cdEmployeEntity.convertToEmployee())
        }
        return allEmployees
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        let result = getCDEmployee(byIdentifier: id)
        guard result != nil else { return nil }
        return result?.convertToEmployee()
    }
    
    func update(record: Employee) -> Bool {
        let result = getCDEmployee(byIdentifier: record.id)
        guard result != nil else { return false }
        result?.id = record.id
        result?.email = record.email
        result?.profilePic = record.profilePic
        result?.name = record.name
        if record.passport != nil{
            let resultPassport = getCDPassportEntity(byIdentifier: record.passport!.id)
            if resultPassport != nil{
                resultPassport?.id = record.passport?.id
                resultPassport?.passportId = record.passport?.passportId
                resultPassport?.placeOfIssue = record.passport?.placeOfIssue
                result?.toPassport = resultPassport
            }
        }
        PersistantStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let cdEmployee = getCDEmployee(byIdentifier: id)
        guard cdEmployee != nil else { return false }
        PersistantStorage.shared.context.delete(cdEmployee!)
        PersistantStorage.shared.saveContext()
        return true
    }
    
    private func getCDEmployee(byIdentifier id: UUID) -> CDEmployeEntity?{
        let fetchRequest = NSFetchRequest<CDEmployeEntity>(entityName: "CDEmployeEntity")
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
