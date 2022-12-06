//
//  ViewController.swift
//  GingerBuild
//
//  Created by Alex Masztak on 10/25/22.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let player = player, player.isPlaying {
            // stop playback
            
            player.stop()
            
        }
        else {
            //set up player, and play
            let urlString = Bundle.main.path(forResource: "Fortnite", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }

                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else {
                    return
                }
                player.numberOfLoops = -1
                player.play()
            }
            catch {
                print("somthing went wrong")
            }
        }
    }

    @IBAction func charityLink(_ sender: Any) {
        
    }
}

