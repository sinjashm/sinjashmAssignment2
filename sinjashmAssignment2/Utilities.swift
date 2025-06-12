//
//  Utilities.swift
//  sinjashmAssignment2
//
//  Created by Jashman Singh on 12/06/25.
//

import Foundation

class Utils {
    static func readLineTrimmed() -> String { readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "" }

    static func promptInt(_ msg: String) -> Int {
        while true {
            print(msg, terminator: " ")
            if let v = Int(readLineTrimmed()) { return v }
            print("Invalid integer – try again.")
        }
    }

    static func promptDouble(_ msg: String) -> Double {
        while true {
            print(msg, terminator: " ")
            if let v = Double(readLineTrimmed()) { return v }
            print("Invalid number – try again.")
        }
    }
}
