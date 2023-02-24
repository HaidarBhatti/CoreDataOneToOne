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
    
    func create(employee: Employee) {
        <#code#>
    }
    
    func getAll() -> [Employee]? {
        let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDEmployeEntity.self)
        var allEmployees: [Employee] = []
        result?.forEach({ employee in
            allEmployees.append(employee.convertToEmployee())
        })
        return allEmployees
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        let result = getCDEmployee(byIdentifier: id)
        guard result != nil else { return nil }
        return result?.convertToEmployee()
    }
    
    func update(employee: Employee) -> Bool {
        let cdEmployee = getCDEmployee(byIdentifier: employee.id)
        guard cdEmployee != nil else { return false }
        cdEmployee?.profilePic = employee.profilePic
        cdEmployee?.name = employee.name
        cdEmployee?.email = employee.email
        PersistantStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let cdEmployee = getCDEmployee(byIdentifier: id)
        guard cdEmployee != nil else { return false }
        PersistantStorage.shared.context.delete(cdEmployee!)
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
}
