//
//  reserveViewController.swift
//  GingerBuild
//
//  Created by Alexander Masztak on 11/4/22.
//

import UIKit

class reserveViewController: UIViewController {
    
    var counter = 10
    
    @IBOutlet weak var tableLabel: UILabel!

    
    @IBOutlet weak var countDownLabel: UILabel!
    
    var table = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
        tableLabel.text = table
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            countDownLabel.text = ("\(counter) until sent back")
            counter -= 1
        }
    }
}
