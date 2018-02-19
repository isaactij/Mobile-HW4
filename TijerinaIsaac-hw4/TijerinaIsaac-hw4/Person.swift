//
//  Person.swift
//  TijerinaIsaac-hw4
//
//  Created by Isaac on 2/18/18.
//  Copyright © 2018 TijerinaIsaac. All rights reserved.
//

import Foundation
class Person{
    var firstName:String
    var lastName:String
    var age:Int
    var street:String
    var city:String
    var state:String
    var zip:Int
    
    init?(firstName newFirstName:String, lastName newLastName:String, age newAge:Int, street newStreet:String, city newCity:String, state newState:String, zip newZip:Int){
        firstName = newFirstName
        lastName = newLastName
        age = newAge
        street = newStreet
        city = newCity
        state = newState
        zip = newZip
    }
}
