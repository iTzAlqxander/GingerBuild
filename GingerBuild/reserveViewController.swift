//
//  reserveViewController.swift
//  GingerBuild
//
//  Created by Alexander Masztak on 11/4/22.
//

import UIKit
import Firebase

class reserveViewController: UIViewController {
    
    let dataBase = Database.database().reference()

    var totalSecond = 600
    var timer:Timer?
    
    @IBOutlet weak var tableLabel: UILabel!

    
    @IBOutlet weak var countDownLabel: UILabel!
    
    var table = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        startTimer()
        
        
        tableLabel.text = table
    }
    
    func startTimer(){
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }

    @objc func countdown() {
        var minutes: Int
        var seconds: Int

        if totalSecond == 1 {
            timer?.invalidate()
            dataBase.child("TableTaken").updateChildValues([table: false])
            
        }
        totalSecond = totalSecond - 1

        minutes = (totalSecond % 3600) / 60
        seconds = (totalSecond % 3600) % 60
        countDownLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
}
