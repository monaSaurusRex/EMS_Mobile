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
	
//	//MARK: Enum for state management in fake login delay
//	enum ViewState {
//			case loading
//			case success
//			case failed
//			case none
//		}
//
//	//MARK: Declarations
////	@IBOutlet weak var firstNameText: UITextField!
////	@IBOutlet weak var lastNameText: UITextField!
////	@IBOutlet weak var emailText: UITextField!
////	@IBOutlet weak var contactText: UITextField!
////
////	@IBOutlet weak var addButton: UIButton!
//
//	@Published var firstName = ""
//	@Published var lastName = ""
//	@Published var email: String?
//	@Published var contact: String?
//
//	var state: ViewState = .none
//
//	var employeeData = [Employee]()//employee data model
//
//
////	var isNotEmptyFirstnamePublisher: AnyPublisher<Bool, Never>{
////		$firstName.self{
////			.map{ !$0.isEmpty }
////			.eraseToAnyPublisher()
////		}
////	}
////
////	var isNotEmptyLastnamePublisher: AnyPublisher<Bool, Never>{
////		$lastName.self{
////			.map{ !$0.isEmpty }
////			.eraseToAnyPublisher()
////		}
////	}
////
////	var isValidEmailPublisher: AnyPublisher<Bool, Never>{
////		$email.self{
////			.map{ $0.isValidEmail? }
////			.eraseToAnyPublisher()
////		}
////	}
////
////	var isValidContactPublisher: AnyPublisher<Bool, Never>{
////		$contact.self{
////			.map { $0.isValidContact? }
////			.eraseToAnyPublisher()
////		}
////	}
////
////	var isSubmitEnabled: AnyPublisher<Bool, Never>{
////		Publishers.CombineLatest4(isNotEmptyFirstnamePublisher, isNotEmptyLastnamePublisher, isValidEmailPublisher, isValidContactPublisher)
////			.map{ $0 && $1 && $2 && $3}
////			.eraseToAnyPublisher()
////	}
//
//	override func viewDidLoad() {
//        super.viewDidLoad()
//
////		firstNameText.text = firstName
////		lastNameText.text = lastName
////		emailText.text = email
////		contactText.text = contact
//        // Do any additional setup after loading the view.
//    }
//
//	//fetch Api dat
//	   func fetchApiData(URL url: String, completion: @escaping([Employee])->Void){
//
//		   let url = URL(string: url)
//
//		   let session = URLSession.shared
//
//		   let dataTask = session.dataTask(with: url!) {data, response, error in
//			   if data != nil && error == nil{
//				   do{
//					   let parsingData = try JSONDecoder().decode([Employee].self, from: data!)
//					   completion(parsingData)
//
//				   }catch{
//					   print("parsing error")
//				   }
//			   }
//		   }
//			   dataTask.resume()
//	   }
//
//   }
//
//	func onSubmit(){
//		state = .loading
//			//harcoded 1.5 second delay to simulate a request being sent and processed
//		DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)){ [weak self] in
//			guard let self = self
//			else{
//				return
//			}
//
//			if self.isCorrectLogin(){
//				self.state = .success
//			}
//			else{
//				self.state = .failed
//			}
//		}
//	}
//
//	func isCorrectLogin() -> Bool {
//		//hardcoded example
////		return firstName == firstNameText.text; lastName == lastNameText.text; email == emailText.text; contact == contactText.text
//		return true
//	}
//
//	func showAlert(message: String) {
//			let alertController = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
//			let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//			alertController.addAction(okAction)
//
//			if let viewController = UIApplication.shared.keyWindow?.rootViewController {
//				viewController.present(alertController, animated: true, completion: nil)
//			}
//		}
//	// Validate first name
//				guard !firstName.isEmpty else {
//					showAlert(message: "Please enter your first name")
//					return
//				}
//
//			// Validate middle name
//			guard !middleName.isEmpty else {
//				showAlert(message: "Please enter your middle name")
//
//				return
//			}
//
//				// Validate last name
//				guard !lastName.isEmpty else {
//					showAlert(message: "Please enter your surname")
//					return
//				}
//
//				// Validate email format
//				guard isValidEmail(email) else {
//					showAlert(message: "Please enter your email address as it is not in the correct format")
//					return
//				}
//
//				// Validate department
//				guard !department.isEmpty else {
//					showAlert(message: "Please enter your department")
//					return
//				}
//}
//
////extension String{
////	var isvalidEmail: Bool{
////		return NSPredicate(
////		format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
////		)
////		.evaluate(with: self)
////	}
////
////	var isValidCOntact: Bool{
////		let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
////		let phoneTest = NSPredicate(
////			format: "SELF MATCHES %@", PHONE_REGEX
////		)
////		return phoneTest.evaluate(with: self)
////	}
}
