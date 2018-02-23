//
//  ContactTableViewController.swift
//  TijerinaIsaac-hw4
//
//  Created by Isaac on 2/18/18.
//  Copyright © 2018 TijerinaIsaac. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
    //Person array to hold the people data model
    public var people:[Person?] = [Person?](repeating:nil, count:9)
    
    //Creates the data model in the people array
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
    
    //First thing called
    override func viewDidLoad() {
        super.viewDidLoad()
        createDataModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count * 2
    }

    //Adds info to rows
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Gets the index of the row being manipulated
        var row:Int = indexPath.row
        //If row is divisible by two
        if(row % 2 == 0){
            //Divide it by two to get the people row
            row = row / 2
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameTableViewCell
            cell.firstNameLabel.text = people[row]!.firstName
            cell.lastNameLabel.text = people[row]!.lastName
            cell.delegate = self
            return cell
            
        }else{
            //Subtract one and divide by two to get the people row
            row = (row - 1) / 2
            let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AddressTableViewCell
            cell.streetLabel.text = people[row]!.street
            cell.cityLabel.text = people[row]!.city
            cell.stateLabel.text = people[row]!.state
            cell.zipLabel.text = "\(people[row]!.zip)"
            return cell
        }
    }
    
    //Changes the height of the table row with alternating heights
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row % 2 == 0 ){
            return 50
        }else{
            return 55
        }
    }
    
}


extension ContactTableViewController: NameTableViewCellProtocol{
    
    func displayAlert(firstName: String?){
        //Searches for the person index based on the firstNameLabel
        var row:Int = 0
        for i in 0...8 {
            if(firstName == people[i]!.firstName){
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
}
