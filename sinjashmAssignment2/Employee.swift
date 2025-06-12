//
//  Employee.swift
//  sinjashmAssignment2
//
//  Created by Jashman Singh on 12/06/25.
//
// jashman Singh, 991676480
import Foundation

// MARK: – Base
class Employee {
    let name: String
    let id: Int
    // Computed salary – overridden by subclasses
    var salary: Double { 0 }

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }

    func displayDetails() {
        print("ID: \(id)  Name: \(name)  Salary: $\(String(format: "%.2f", salary))")
    }
}

// MARK: – Protocol
protocol Taxable {
    func calculateTax() -> Double
}

// MARK: – Full‑Time
class FullTimeEmployee: Employee, Taxable {
    var monthlySalary: Double
    override var salary: Double { monthlySalary }

    init(name: String, id: Int, monthlySalary: Double) {
        self.monthlySalary = monthlySalary
        super.init(name: name, id: id)
    }

    func calculateTax() -> Double { salary * 0.20 } // 20 %

    override func displayDetails() {
        super.displayDetails()
        print("   Type: Full‑Time  Monthly: $\(monthlySalary)  Tax: $\(String(format: "%.2f", calculateTax()))")
    }
}

// MARK: – Part‑Time
class PartTimeEmployee: Employee, Taxable {
    var hourlyRate: Double
    var hoursWorked: Int
    override var salary: Double { hourlyRate * Double(hoursWorked) }

    init(name: String, id: Int, hourlyRate: Double, hoursWorked: Int) {
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
        super.init(name: name, id: id)
    }

    func calculateTax() -> Double { salary * 0.10 } // 10 %

    override func displayDetails() {
        super.displayDetails()
        print("   Type: Part‑Time  Rate: $\(hourlyRate)  Hours: \(hoursWorked)  Tax: $\(String(format: "%.2f", calculateTax()))")
    }
}
