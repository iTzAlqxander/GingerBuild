//
//  tableViewController.swift
//  GingerBuild
//
//  Created by Alexander Masztak on 11/4/22.
//

import UIKit
import Firebase

class tableViewController: UIViewController {
    
    let dataBase = Database.database().reference()

    var table = ""
    var used = true
    var beingUsed = "beingUsed"
    var taken = "isTaken"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataBase.child("Tables").child("table1").updateChildValues([beingUsed: false])
        dataBase.child("Tables").child("table2").updateChildValues([beingUsed: false])
        dataBase.child("Tables").child("table3").updateChildValues([beingUsed: false])
        dataBase.child("Tables").child("table4").updateChildValues([beingUsed: false])
        
        dataBase.child("Tables").child("table1").updateChildValues(["Members": "None"])
        dataBase.child("Tables").child("table2").updateChildValues(["Members": "None"])
        dataBase.child("Tables").child("table3").updateChildValues(["Members": "None"])
        dataBase.child("Tables").child("table4").updateChildValues(["Members": "None"])
        
        dataBase.child("Tables").child("table1").updateChildValues(["Club": "None"])
        dataBase.child("Tables").child("table2").updateChildValues(["Club": "None"])
        dataBase.child("Tables").child("table3").updateChildValues(["Club": "None"])
        dataBase.child("Tables").child("table4").updateChildValues(["Club": "None"])
        
        dataBase.child("Tables").child("table1").updateChildValues([taken: false])
        dataBase.child("Tables").child("table2").updateChildValues([taken: false])
        dataBase.child("Tables").child("table3").updateChildValues([taken: false])
        dataBase.child("Tables").child("table4").updateChildValues([taken: false])
        
         
        
        
    }
    
    
    @IBAction func whenTable1Pressed(_ sender: UIButton) {
        table = "table1"
        dataBase.child("Tables").child("table1").updateChildValues([beingUsed: used])
        performSegue(withIdentifier: "toReserve", sender: self)
        
        dataBase.child("Tables").child("table1").updateChildValues([beingUsed: true])
    }
    
    @IBAction func whenTable2Pressed(_ sender: UIButton) {
        table = "table2"
        dataBase.child("Tables").child("table2").updateChildValues([beingUsed: used])
        performSegue(withIdentifier: "toReserve", sender: self)
        
        dataBase.child("Tables").child("table2").updateChildValues([beingUsed: true])
    }
    
    @IBAction func whenTable3Pressed(_ sender: UIButton) {
        table = "table3"
        dataBase.child("Tables").child("table3").updateChildValues([beingUsed: used])
        performSegue(withIdentifier: "toReserve", sender: self)
        
        dataBase.child("Tables").child("table3").updateChildValues([beingUsed: true])
    }
    
    @IBAction func whenTable4Pressed(_ sender: UIButton) {
        table = "table4"
        dataBase.child("Tables").child("table4").updateChildValues([beingUsed: used])
        performSegue(withIdentifier: "toReserve", sender: self)
        
        dataBase.child("Tables").child("table4").updateChildValues([beingUsed: true])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toReserve") {
            let vc = segue.destination as! reserveViewController
            vc.table = table
        }
    }
}
