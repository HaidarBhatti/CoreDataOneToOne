//
//  EmployeeListVC.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//

import UIKit

class EmployeeListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let manager = EmployeeManager()
    var tableData = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeTableViewCell")
        tableView.register(UINib(nibName: "NoDataTableViewCell", bundle: nil), forCellReuseIdentifier: "NoDataTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let tableData = manager.getEmployees(){
            self.tableData = tableData
            tableView.reloadData()
        }
    }

}

extension EmployeeListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableData.count > 0{
            return tableData.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableData.count > 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
            cell.lblEmployeeName.text = tableData[indexPath.row].name
            cell.imgEmployee.image = UIImage(data: tableData[indexPath.row].profilePic)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoDataTableViewCell", for: indexPath) as! NoDataTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableData.count > 0{
            let vc = storyboard?.instantiateViewController(withIdentifier: "CreateEmployeeVC") as! CreateEmployeeVC
            vc.employee = tableData[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
