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

    var totalSecond = 30
    var timer:Timer?
    
    @IBOutlet weak var tableLabel: UILabel!
    @IBOutlet weak var clubTextField: UITextField!
    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBOutlet weak var captainTextField: UITextField!
    @IBOutlet weak var member2TextField: UITextField!
    @IBOutlet weak var member3TextField: UITextField!
    @IBOutlet weak var member4TextField: UITextField!
    
    var table = String()
    var club = String()
    var beingUsed = "beingUsed"
    var membersArray: [String] = []
    var isTaken = "isTaken"

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
            performSegue(withIdentifier: "backTableSelect", sender: self)
            dataBase.child("Tables").child(table).updateChildValues([beingUsed: false])
            countDownLabel.textColor = .black
            
        }
        if totalSecond < 10{
            countDownLabel.textColor = .red
        }
        
        totalSecond = totalSecond - 1

        minutes = (totalSecond % 3600) / 60
        seconds = (totalSecond % 3600) % 60
        countDownLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    @IBAction func submit(_ sender: UIButton) {
        
        timer?.invalidate()
        
        navigationController?.navigationBar.tintColor = UIColor.lightGray
        navigationController?.navigationBar.isHidden = true
        
        var cap1 = captainTextField.text ?? "Error"
        var mem2 = member2TextField.text ?? "Error"
        var mem3 = member3TextField.text ?? "Error"
        var mem4 = member4TextField.text ?? "Error"

        
        membersArray.append(cap1)
        membersArray.append(mem2)
        membersArray.append(mem3)
        membersArray.append(mem4)

        
        club = clubTextField.text ?? "Error"
        dataBase.child("Tables").child(table).updateChildValues(["Club": club])
        
        dataBase.child("Tables").child(table).updateChildValues(["Members": membersArray])
        
        dataBase.child("Tables").child(table).updateChildValues(["isTaken": true])


    }
}
