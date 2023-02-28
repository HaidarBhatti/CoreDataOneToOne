//
//  EmployeeManager.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 27/02/2023.
//

import Foundation

class EmployeeManager{
    
    private let employeeRepository = EmployeeDataRepository()
    
    func createEmployee(employee: Employee){
        if !validatePassport(passport: employee.passport){
            employee.passport = nil
        }
        employeeRepository.create(record: employee)
    }
    
    func getEmployees() -> [Employee]?{
        return employeeRepository.getAll()
    }
    
    func getEmployee(withIdentifier id: UUID) -> Employee?{
        return employeeRepository.get(byIdentifier: id)
    }
    
    func updateEmployee(employee: Employee) -> Bool{
        return employeeRepository.update(record: employee)
    }
    
    func deleteEmployee(id: UUID) -> Bool{
        return employeeRepository.delete(id: id)
    }
    
    func validatePassport(passport: Passport?) -> Bool{
        if passport == nil || passport?.passportId?.isEmpty == true || passport?.placeOfIssue?.isEmpty == true {
            return false
        }
        return true
    }
}
