//
//  SecondViewController.swift
//  ProtocolDelegateUpdatedTask
//
//  Created by Mac on 22/09/21.
//

import UIKit

//MARK: Declaration of SecondViewControllerProtocol

protocol SecondViewControllerProtocol: class {
    func passDataToVC1 (_text2a:String?, _text2b:String?, _ipath: IndexPath)
}

//MARK: Second View Controller Class
class SecondViewController: UIViewController {

    @IBOutlet weak var Label1VC2: UILabel!
    @IBOutlet weak var Label2VC2: UILabel!
    
    var passedname: String?
    var passedvalue: String?
    var ipath: IndexPath?
    
    weak var delegateVC2 : SecondViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Label1VC2.text = passedname
        Label2VC2.text = passedvalue
    }
    
    @IBAction func editData(_ sender: Any) {
        if let VC3 = storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController {
            VC3.updatedName = Label1VC2.text!
            VC3.updatedValue = Label2VC2.text!
            VC3.delegateVC3 = self
            self.navigationController?.pushViewController(VC3, animated: true)
        }
}
    
    @IBAction func updateToVC1(_ sender: Any) {
        delegateVC2?.passDataToVC1(_text2a: Label1VC2.text, _text2b: Label2VC2.text, _ipath: ipath!)
            self.navigationController?.popViewController(animated: true)
        }
    }

//MARK: Confirming ThirdViewControllerProtocol

extension SecondViewController: ThirdViewControllerProtocol {
    func passdatatoVC2(text3a: String?, text3b: String?) {
        Label1VC2.text = text3a
        Label2VC2.text = text3b
    }
}
