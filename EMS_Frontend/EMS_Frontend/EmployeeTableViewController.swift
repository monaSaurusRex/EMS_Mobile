//
//  EmployeeTableViewController.swift
//  EMS_Frontend
//
//  Created by DA MAC M1 158 on 2023/05/25.
//

import UIKit

class EmployeeTableViewController: UIViewController {

    @IBOutlet weak var employeeTV: UITableView!
    
    var employeeData = [Employee]()//employee data model
    var searchingArray = [Employee]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employeeTV.dataSource = self
        employeeTV.delegate = self
        
        //api connection
        fetchApiData(URL: "http://localhost:8080/employees"){ result in
                self.employeeData = result
                print(result)
                DispatchQueue.main.async{
                self.employeeTV.reloadData()
            }
        }
    }
    
    //fetch Api dat
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

extension EmployeeTableViewController:UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    
    //number of cells to display in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        if searching{ //while searching employee table view
            return searchingArray.count
        }
        
        //when search is disabled
        return employeeData.count
    }
    
    //function to populate the tableview cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = employeeTV.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as? EmployeeTableViewCell else {return UITableViewCell()}
        
        if searching {
            cell.employeeNum.text = "Emp#: \(searchingArray[indexPath.row].id)"
            cell.empFirstName.text = "\(searchingArray[indexPath.row].firstName)"
            cell.empLastName.text = "\(searchingArray[indexPath.row].lastName)"
        }else{
            cell.employeeNum.text = "Emp#: \(employeeData[indexPath.row].id)"
            cell.empFirstName.text = "\(employeeData[indexPath.row].firstName)"
            cell.empLastName.text = "\(employeeData[indexPath.row].lastName)"
        }
        
        return cell
    }
    
    //search functionality
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingArray = employeeData.filter{ ($0.firstName.prefix(searchText.count).lowercased().contains(searchText.lowercased()))}
        searching = true
        employeeTV.reloadData()
    }
    
    //send data to next form
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewDetailsVC") as? ViewDetailsVC
        
//        vc?.firstNameLabel.text = employeeData[indexPath.row].firstName
//        vc?.lastNameLabel.text = employeeData[indexPath.row].lastName
//        vc?.contactLabel.text = employeeData[indexPath.row].contactNo
//        vc?.emailLabel.text = employeeData[indexPath.row].email
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    //calling edit for delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
        
    }
    
    //delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            presentDeletionFailsafe(indexPath: indexPath)
        }
//        
//        tableView.beginUpdates()
//        employeeData.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .fade)
//        tableView.endUpdates()
        
    }
    
    func presentDeletionFailsafe(indexPath: IndexPath){
        let alert = UIAlertController(title: nil, message: "Are you sure you want to delete this record?", preferredStyle: .alert)
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
