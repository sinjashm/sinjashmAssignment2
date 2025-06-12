//
//  main.swift
//  sinjashmAssignment2
//
//  Created by Jashman Singh on 12/06/25.
//

import Foundation
let manager = EmpManager()

func menu() {
    print("""
    ================ Employee Management ================
    1. Add Full‑Time Employee
    2. Add Part‑Time Employee
    3. Display All Employees
    4. Remove Employee by ID
    5. Search Employee by ID
    6. Exit
    """)
}

func addFullTime() {
    print("Enter Employee Name:", terminator: " ")
    let name = Utils.readLineTrimmed()
    let id = Utils.promptInt("Enter Employee ID:")
    let salary = Utils.promptDouble("Enter Monthly Salary:")
    let emp = FullTimeEmployee(name: name, id: id, monthlySalary: salary)
    if manager.add(emp) {
        print("Employee added successfully!\n")
    } else { print("❌ ID already exists.\n") }
}

func addPartTime() {
    print("Enter Employee Name:", terminator: " ")
    let name = Utils.readLineTrimmed()
    let id = Utils.promptInt("Enter Employee ID:")
    let rate = Utils.promptDouble("Enter Hourly Rate:")
    let hours = Utils.promptInt("Enter Hours Worked:")
    let emp = PartTimeEmployee(name: name, id: id, hourlyRate: rate, hoursWorked: hours)
    if manager.add(emp) {
        print("Employee added successfully!\n")
    } else { print("❌ ID already exists.\n") }
}

func displayAll() {
    let list = manager.all()
    if list.isEmpty { print("No employees to display.\n"); return }
    print("Displaying All Employees:")
    list.forEach { $0.displayDetails() }
    print("")
}

func removeById() {
    let id = Utils.promptInt("Enter Employee ID to remove:")
    if manager.remove(id: id) != nil {
        print("Employee removed.\n")
    } else { print("❌ ID not found.\n") }
}

func searchById() {
    let id = Utils.promptInt("Enter Employee ID to search:")
    if let emp = manager.find(id: id) {
        emp.displayDetails(); print("")
    } else { print("❌ ID not found.\n") }
}

while true {
    menu()
    switch Utils.promptInt("Enter your choice:") {
    case 1: addFullTime()
    case 2: addPartTime()
    case 3: displayAll()
    case 4: removeById()
    case 5: searchById()
    case 6: print("Goodbye!"); exit(0)
    default: print("Invalid choice.\n")
    }
}
