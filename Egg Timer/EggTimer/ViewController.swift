//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes: [String: Int] = ["Soft":5, "Medium":7, "Hard":12]
    @IBOutlet weak var textResult: UILabel!
    var player: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0.0
        let hardnessButtonTitle = sender.currentTitle
        let time = eggTimes[hardnessButtonTitle!]! * 15
        countDownTimer(counter: Double(time))
    }
    
    func countDownTimer(counter: Double){
        var timing = counter
        let progress: Double = 1.0/timing
        progressBar.progress = 0.0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            timing-=1
            if timing == 0 {
                self.done(timer: timer, progress: progress)
            }else{
                progressBar.progress += Float(progress)
            }
        }
    }
    
    func playSound(){
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
    }
    func done(timer: Timer, progress: Double){
        timer.invalidate()
        progressBar.progress += Float(progress)
        self.playSound()
        textResult.text = String("Your egg is done!")
    }
}
