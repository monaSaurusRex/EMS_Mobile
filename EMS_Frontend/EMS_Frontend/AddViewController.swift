//
//  AddViewController.swift
//  EMS_Frontend
//
//  Created by DA MAC M1 135 on 2023/05/26.
//

import UIKit
import Combine
import Foundation

class AddViewController: UIViewController, ObservableObject {
	
	//MARK: Declarations
	@IBOutlet weak var firstNameText: UITextField!
	@IBOutlet weak var lastNameText: UITextField!
	@IBOutlet weak var emailText: UITextField!
	@IBOutlet weak var contactText: UITextField!
	
	
	var firstName: String?
	var lastName: String?
	var email: String?
	var contact: String?
	
	var employeeData = [Employee]()//employee data model
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		firstNameText.text = firstName
		lastNameText.text = lastName
		emailText.text = email
		contactText.text = contact
		// Do any additional setup after loading the view.
	}
	
	@IBAction func addButton(_ sender: UIButton) {
		
//		let emptyName = namesIsEmpty(firstName: firstNameText.text)
//		let emptySurname = surnameIsEmpty(lastName: lastNameText.text)
		let validateEmail  = validateEmail(enteredEmail: emailText.text!)
		let validateContact = isValidContact(phone: contactText.text!)
		
		if(validateEmail == false)
		{
			showAlert(title: "Invalid email!", message: "Please enter the correct format: cool.example@example.com")
			
		}
		else if(validateContact == false){
			showAlert(title: "Invalid contact number!", message: "Please enter the correct format: 083-123-4567")
		}
//		else if(emptyName == false)
		
		else{
			showAlert(title: "Success!", message: "New employee successfully created.")
		}
	}
	
	
	//MARK: onSubmit()
	func onSubmit(){
		//harcoded 1.5 second delay to simulate a request being sent and processed
		DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)){ [weak self] in
			guard let self = self
			else{
				return
			}
		}
	}
	
	//MARK: showAlert()
	func showAlert(title: String,  message: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(okAction)
		
		if let viewController = UIApplication.shared.keyWindow?.rootViewController {
			viewController.present(alertController, animated: true, completion: nil)
		}
	}
	
	
//	func namesIsEmpty(firstName: String) -> Bool{
//		// Validate first name
//		guard !firstName.isEmpty else {
//			showAlert(title: "Empty firstname", message: "Firstname cannot be empty! Please try again.")
//			return firstName
//		}
//		return firstName
//	}
//
//	 // Validate last name
//	func surnameIsEmpty(lastName: String) -> Bool{
//		guard !lastName.isEmpty else {
//			showAlert(title: "Empty lastname", message: "Last name cannot be empty! Please try again.")
//			return lastName
//		}
//		return lastName
//	}
	
	// Validate email format
//	func isValidEmail() -> NSPredicate {
//		return NSPredicate {_,_ in
//			self.showAlert(title: "Invalid Email" message: "Incorrect format. Correct format: cool.example@example.com")
//			return NSPredicate(
//				format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//			)
//			.evaluate(with: self)
//		}
		
	func isValidContact(phone: String) -> Bool{
			let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
			let phoneTest = NSPredicate(
				format: "SELF MATCHES %@", PHONE_REGEX
			)
			return phoneTest.evaluate(with: phone)
		}
	}


func validateEmail(enteredEmail:String) -> Bool {

		let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
		return emailPredicate.evaluate(with: enteredEmail)

	}

//extension String{
//	var isvalidEmail: Bool{
//		return NSPredicate(
//		format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//		)
//		.evaluate(with: self)
//	}
//
//	var isValidCOntact: Bool{
//		let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
//		let phoneTest = NSPredicate(
//			format: "SELF MATCHES %@", PHONE_REGEX
//		)
//		return phoneTest.evaluate(with: self)
//	}
//}
