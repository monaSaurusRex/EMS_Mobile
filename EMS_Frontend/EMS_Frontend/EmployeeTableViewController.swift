//
//  EmployeeTableViewController.swift
//  EMS_Frontend
//
//  Created by DA MAC M1 158 on 2023/05/25.
//

import UIKit

class EmployeeTableViewController: UIViewController {

    @IBOutlet weak var employeeTV: UITableView!
    
    var employeeData = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employeeTV.dataSource = self
        employeeTV.delegate = self

        fetchApiData(URL: "http://localhost:8080/employees"){ result in
                self.employeeData = result
                print(result)
                DispatchQueue.main.async{
                self.employeeTV.reloadData()
            }
        }
    }
    
    func fetchApiData(URL url: String, completion: @escaping([Employee])->Void){
        
        let url = URL(string: url)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) {data, response, error in
            if data != nil && error == nil{
                do{
                    let parsingData = try JSONDecoder().decode([Employee].self, from: data!)
                    completion(parsingData)
                    
                }catch{
                    print("parsing error")
                }
            }
        }
            dataTask.resume()
    }
    
}

extension EmployeeTableViewController:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = employeeTV.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as? EmployeeTableViewCell else {return UITableViewCell()}
        
        cell.employeeNum.text = "\(employeeData[indexPath.row].id)"
        cell.empFirstName.text = "\(employeeData[indexPath.row].firstName)"
        cell.empLastName.text = "\(employeeData[indexPath.row].lastName)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }

    //fucntion to delete a row
    //can edit with and delete with this code by asking for the edit function first,
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //message pop up for the alert message before you delete
        if editingStyle == .delete{
            presentDeletionFailsafe(indexPath: indexPath)
        }
//this is the actual method for the delete I just addes the self. since it was giving me an error
//        //begin update/ editing
//        tableView.beginUpdates()
//        //removing one row from array, the Int is indexPath
//        array.remove(at: indexPath.row)
//        //delete the selected row
//        tableView.deleteRows(at: [indexPath], with: .fade)
//        //end updates
//        tableView.endUpdates()
    }
    //function for the pop up button
    func presentDeletionFailsafe(indexPath: IndexPath){
        let alert = UIAlertController(title: nil, message: "Hey dear are you sure you want to delete!!", preferredStyle: .alert)
        //yes action declaration
        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            
            //begin update/ editing
            self.employeeTV.beginUpdates()
            //removing one row from array, the Int is indexPath
            self.employeeData.remove(at: indexPath.row)
            //delete the selected row
            self.employeeTV.deleteRows(at: [indexPath], with: .fade)
            //end updates
            self.employeeTV.endUpdates()
        }
        alert.addAction(yesAction)
        //cancel action
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
