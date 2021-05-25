//
//  ViewController.swift
//  StopWatch
//
//  Created by Erzhan Kubatov on 22/5/21.
//

import UIKit

class StopwatchViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false
        pauseButton.isEnabled = false
        playButton.isEnabled = true
    }

    
    @IBAction func playPressed(_ sender: UIButton) {
        if !isTimerRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
             
            stopButton.isEnabled = true
            pauseButton.isEnabled = true
            playButton.isEnabled = false
        }
    }
    
    @IBAction func pausePressed(_ sender: UIButton) {
        stopButton.isEnabled = true
        pauseButton.isEnabled = false
        playButton.isEnabled = true

        isTimerRunning = false
        timer.invalidate()
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        timerLabel.text = "00:00:00"
        
        stopButton.isEnabled = false
        pauseButton.isEnabled = false
        playButton.isEnabled = true
        
    }
    
    @objc func runTimer() {
        counter += 0.1
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10{
            minuteString = "0\(minute)"
        }
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        timerLabel.text =  "\(hour):\(minuteString):\(secondString)"
    }
    
    
}

