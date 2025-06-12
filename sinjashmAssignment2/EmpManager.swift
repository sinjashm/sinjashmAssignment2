//
//  EmpManager.swift
//  sinjashmAssignment2
//
//  Created by Jashman Singh on 12/06/25.
//

import Foundation

class EmpManager {
    private var store: [Int: Employee] = [:] // ID → Employee

    // Add (returns false if duplicate)
    func add(_ emp: Employee) -> Bool {
        guard store[emp.id] == nil else { return false }
        store[emp.id] = emp
        return true
    }

    // Remove (returns the removed employee or nil)
    func remove(id: Int) -> Employee? { store.removeValue(forKey: id) }

    // Search
    func find(id: Int) -> Employee? { store[id] }

    // All employees
    func all() -> [Employee] { Array(store.values).sorted { $0.id < $1.id } }
}
