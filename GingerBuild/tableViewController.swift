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
    var taken = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataBase.child("TableTaken").updateChildValues(["table1": false])
        dataBase.child("TableTaken").updateChildValues(["table2": false])
        dataBase.child("TableTaken").updateChildValues(["table3": false])
        dataBase.child("TableTaken").updateChildValues(["table4": false])

        
    }
    
    
    
    @IBAction func whenTable1Pressed(_ sender: UIButton) {
        table = "table1"
        dataBase.child("TableTaken").updateChildValues([table: taken])
        performSegue(withIdentifier: "toReserve", sender: self)
    
    }
    
    @IBAction func whenTable2Pressed(_ sender: UIButton) {
        table = "table2"
        dataBase.child("TableTaken").updateChildValues([table: taken])
        performSegue(withIdentifier: "toReserve", sender: self)
    }
    
    @IBAction func whenTable3Pressed(_ sender: UIButton) {
        table = "table3"
        dataBase.child("TableTaken").updateChildValues([table: taken])
        performSegue(withIdentifier: "toReserve", sender: self)
    }
    
    @IBAction func whenTable4Pressed(_ sender: UIButton) {
        table = "table4"
        dataBase.child("TableTaken").updateChildValues([table: taken])
        performSegue(withIdentifier: "toReserve", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toReserve") {
            let vc = segue.destination as! reserveViewController
            vc.table = table
        }
    }
}
