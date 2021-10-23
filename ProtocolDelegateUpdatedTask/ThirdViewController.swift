//
//  ThirdViewController.swift
//  ProtocolDelegateUpdatedTask
//
//  Created by Mac on 22/09/21.
//

import UIKit

//MARK: Declaration of ThirdViewControllerProtocol

protocol ThirdViewControllerProtocol: class {
    func passdatatoVC2 (text3a:String?, text3b: String?)
}

//MARK: ThirdViewController Class

class ThirdViewController: UIViewController{

    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var updatedAge: UITextField!
    
    var updatedName: String?
    var updatedValue: String?
    
    weak var delegateVC3 : ThirdViewControllerProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editName.text = updatedName
        updatedAge.text = updatedValue
        
 }
    

    @IBAction func updateData(_ sender: Any) {
        
        let nameToVC2 = editName.text
        let ageToVC2 = updatedAge.text
        
        delegateVC3?.passdatatoVC2(text3a: nameToVC2, text3b: ageToVC2)
        self.navigationController?.popViewController(animated: true)
    }
    

}
