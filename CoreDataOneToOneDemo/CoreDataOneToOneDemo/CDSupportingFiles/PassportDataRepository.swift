//
//  PassportDataRepository.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import Foundation
import CoreData

protocol PassportRepository: BaseRepository{
    
}

struct PassportDataRepository: EmployeeRepository{
    
    typealias T = Passport
    
    func create(record: Passport) {
        print("will create")
    }
    
    func getAll() -> [Passport]? {
        guard let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDPassportEntity.self) else { return nil }
        var allPassport: [Passport] = []
        
        result.forEach { CDPassportEntity in
            allPassport.append(CDPassportEntity.convertToPassport())
        }
        
        return allPassport
    }
    
    func get(byIdentifier id: UUID) -> Passport? {
        return nil
    }
    
    func update(record: Passport) -> Bool {
        return true
    }
    
    func delete(id: UUID) -> Bool {
        return true
    }
    
}
