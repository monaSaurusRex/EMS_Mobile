//
//  ViewDetailsVC.swift
//  EMS_Frontend
//
//  Created by DA MAC M1 135 on 2023/05/25.
//

import UIKit

class ViewDetailsVC: UIViewController {

	
	@IBOutlet weak var firstNameLabel: UILabel!
	@IBOutlet weak var lastNameLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var contactLabel: UILabel!
	
	var firstName: String?
	var lastName: String?
	var email: String?
	var contact: String?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		firstNameLabel.text = firstName
		lastNameLabel.text = lastName
		emailLabel.text = email
		contactLabel.text = contact
        // Do any additional setup after loading the view.
    }

}
