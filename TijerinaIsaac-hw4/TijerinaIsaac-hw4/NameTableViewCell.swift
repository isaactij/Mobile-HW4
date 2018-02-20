//
//  NameTableViewCell.swift
//  TijerinaIsaac-hw4
//
//  Created by Isaac on 2/18/18.
//  Copyright © 2018 TijerinaIsaac. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    //Labels in storyboard
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    //Var to hold the person array
    public var people:[Person?] = [Person?](repeating:nil, count:9)
    
    //Creates the datamodel held by people
    func createDataModel(){
        people[0] = Person.init(firstName: "Joe", lastName: "Johson", age: 35, street: "1 Main Street", city: "Austin", state: "TX", zip: 78128)
        people[1] = Person.init(firstName: "Sam", lastName: "Smith", age: 27, street: "2 Main Street", city: "Marble Falls", state: "TX", zip: 78228)
        people[2] = Person.init(firstName: "Sue", lastName: "Jefferson", age: 52, street: "3 Main Street ", city: "Houston", state: "TX", zip: 78328)
        people[3] = Person.init(firstName: "Zoey", lastName: "Zimmerman", age: 17, street: "4 Main Street", city: "San Antonio", state: "TX", zip: 78428)
        people[4] = Person.init(firstName: "Alan", lastName: "Albright", age: 83, street: "5 Main Street", city: "Dallas", state: "TX", zip: 78528)
        people[5] = Person.init(firstName: "Chris", lastName: "Chambers", age: 33, street: "6 Main Street", city: "Round Rock", state: "TX", zip: 78628)
        people[6] = Person.init(firstName: "Danny", lastName: "Donaldson", age: 6, street: "7 Main Street", city: "Cedar Park", state: "TX", zip: 78728)
        people[7] = Person.init(firstName: "Eli", lastName: "Edgerton", age: 10, street: "8 Main Street", city: "Leander", state: "TX", zip: 78828)
        people[8] = Person.init(firstName: "Frank", lastName: "Farmer", age: 100, street: "9 Main Street", city: "Webster", state: "TX", zip: 78928)
    }

    //Button handler for button in main storyboard
    @IBAction func buttonHandler(_ sender: Any) {
        createDataModel()
        //Searches for the person index based on the firstNameLabel
        var row:Int = 0
        for i in 0...8 {
            if(firstNameLabel.text == people[i]!.firstName){
                row = i
            }
        }
        //Creates alert
        let output:String = "\(people[row]!.firstName) \(people[row]!.lastName) \(people[row]!.age)"
        let alertController:UIAlertController = UIAlertController(title: "Person", message: output, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in print("OK button pressed")}
        alertController.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
