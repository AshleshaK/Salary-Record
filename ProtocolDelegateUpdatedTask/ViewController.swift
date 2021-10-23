//
//  ViewController.swift
//  ProtocolDelegateUpdatedTask
//  This Project is about Salary maintenance. One can edit and update the salary of respective person. This is achieved by Forward and Backward Data passing (Protocol Delegate Method)
//  Created by Mac on 22/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var names = ["Shankar","Bhavna","Nischal","Ashlesha","Siddhant"]
    var salary = ["Rs. 60,000","Rs. 1,80,000","Rs. 30,000","Rs. 30,000","Rs. 35,000"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
    }
}


//MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell1
        cell.Label1.text = names[indexPath.row]
        cell.Label2.text = salary[indexPath.row]
        cell.ipath = indexPath
        cell.cellDelegate = self
        return cell
    }
}


//MARK: SecondViewControllerProtocol

extension ViewController: SecondViewControllerProtocol {
    func passDataToVC1(_text2a text2a: String?, _text2b text2b: String?, _ipath ipath: IndexPath) {
        names[ipath.row] = text2a!
        salary[ipath.row] = text2b!
        self.tableView.reloadRows(at: [ipath], with: .automatic)
    }
    
}


//MARK: PassToUpdateProtocol

extension ViewController: PassToUpdate {
    func passToVC2(textA: String?, textB: String?, ipath: IndexPath) {
        if let secondVcObj = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController {
            secondVcObj.passedname = textA
            secondVcObj.passedvalue = textB
            secondVcObj.ipath = ipath
            secondVcObj.delegateVC2 = self
            
            self.navigationController?.pushViewController(secondVcObj, animated: true)
        }
    }
}
    
    


