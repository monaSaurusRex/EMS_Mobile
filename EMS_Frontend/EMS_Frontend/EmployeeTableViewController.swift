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
    
}
