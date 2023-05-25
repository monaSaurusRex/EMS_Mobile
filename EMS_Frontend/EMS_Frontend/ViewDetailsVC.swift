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
	
	override func viewDidLoad() {
        super.viewDidLoad()

		var firstName = firstNameLabel
		var lastName = lastNameLabel
		var email = emailLabel
		var contact = contactLabel
        // Do any additional setup after loading the view.
    }

}
