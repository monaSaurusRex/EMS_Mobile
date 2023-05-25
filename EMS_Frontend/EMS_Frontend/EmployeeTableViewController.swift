//
//  EmployeeTableViewController.swift
//  EMS_Frontend
//
//  Created by DA MAC M1 158 on 2023/05/25.
//

import UIKit

class EmployeeTableViewController: UIViewController {

    @IBOutlet weak var employeeTV: UITableView!
    
    var employeeData = ["John Doe", "Sally Parson", "Jane Doe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employeeTV.dataSource = self
        employeeTV.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EmployeeTableViewController:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = employeeTV.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as? EmployeeTableViewCell else {return UITableViewCell()}
        
        cell.employeeNum.text = "1"
        cell.empFirstName.text = "John"
        cell.empLastName.text = "Doe"
        
        
        return cell
    }
    
}
