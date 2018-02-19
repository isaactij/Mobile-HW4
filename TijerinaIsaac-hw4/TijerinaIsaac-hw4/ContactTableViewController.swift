//
//  ContactTableViewController.swift
//  TijerinaIsaac-hw4
//
//  Created by Isaac on 2/18/18.
//  Copyright © 2018 TijerinaIsaac. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
    public var people:[Person?] = [Person?](repeating:nil, count:9)
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDataModel()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count * 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var row:Int = indexPath.row
        if(row % 2 == 0){
            row = row / 2
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameTableViewCell
            cell.firstNameLabel.text = people[row]!.firstName
            cell.lastNameLabel.text = people[row]!.lastName
            return cell
            
        }else{
            row = (row - 1) / 2
            let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AddressTableViewCell
            cell.streetLabel.text = people[row]!.street
            cell.cityLabel.text = people[row]!.city
            cell.stateLabel.text = people[row]!.state
            cell.zipLabel.text = "\(people[row]!.zip)"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row % 2 == 0 ){
            return 50
        }else{
            return 55
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
