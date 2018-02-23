//
//  NameTableViewCell.swift
//  TijerinaIsaac-hw4
//
//  Created by Isaac on 2/18/18.
//  Copyright © 2018 TijerinaIsaac. All rights reserved.
//

import UIKit

protocol NameTableViewCellProtocol{
    func displayAlert(firstName: String?)
}

class NameTableViewCell: UITableViewCell {
    //Labels in storyboard
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    var delegate: NameTableViewCellProtocol?

    //Button handler for button in main storyboard
    @IBAction func buttonHandler(_ sender: Any) {
        delegate?.displayAlert(firstName: firstNameLabel.text)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
