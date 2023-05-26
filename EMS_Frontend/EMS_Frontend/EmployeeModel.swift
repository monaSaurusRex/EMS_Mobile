//
//  EmployeeModel.swift
//  EMS_Frontend
//
//  Created by DA MAC M1 158 on 2023/05/25.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let employee = try? JSONDecoder().decode(Employee.self, from: jsonData)
import Foundation

// MARK: - Employee
struct Employee: Codable {
	let id: Int
	let firstName, lastName, email, contactNo: String
	let deleted: Bool
}
