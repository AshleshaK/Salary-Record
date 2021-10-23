//
//  TableViewCell1.swift
//  ProtocolDelegateUpdatedTask
//
//  Created by Mac on 22/09/21.
//

import UIKit

protocol PassToUpdate: AnyObject {
    func passToVC2(textA: String?, textB: String?, ipath: IndexPath)
}

class TableViewCell1: UITableViewCell {

    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    
    var ipath: IndexPath?
    weak var cellDelegate: PassToUpdate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func tapToUpdate(_ sender: Any) {
        cellDelegate?.passToVC2(textA: Label1.text, textB: Label2.text, ipath: ipath!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


