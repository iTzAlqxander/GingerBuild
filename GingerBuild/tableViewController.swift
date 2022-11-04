//
//  tableViewController.swift
//  GingerBuild
//
//  Created by Alexander Masztak on 11/4/22.
//

import UIKit

class tableViewController: UIViewController {

    var table = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    @IBAction func whenTable1Pressed(_ sender: UIButton) {
        table = "table1"
        performSegue(withIdentifier: "toReserve", sender: self)
    
    }
    
    @IBAction func whenTable2Pressed(_ sender: UIButton) {
        table = "table2"
        performSegue(withIdentifier: "toReserve", sender: self)
    }
    
    @IBAction func whenTable3Pressed(_ sender: UIButton) {
        table = "table3"
        performSegue(withIdentifier: "toReserve", sender: self)
    }
    
    @IBAction func whenTable4Pressed(_ sender: UIButton) {
        table = "table4"
        performSegue(withIdentifier: "toReserve", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toReserve") {
            let vc = segue.destination as! reserveViewController
            vc.table = table
        }
    }
}
