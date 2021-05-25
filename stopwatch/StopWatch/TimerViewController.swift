//
//  ViewController.swift
//  StopWatch
//
//  Created by Erzhan Kubatov on 22/5/21.
//

import UIKit

class TimerViewController: UIViewController {

    var seconds = 30
    var timer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        timerLabel.text = String(seconds)
    }
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true) 
    }
    
    @objc func counter(){
        seconds -= 1
        timerLabel.text = String(seconds)
        if (seconds == 0){
            timer.invalidate()
        }
    }
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        timerLabel.text = "30"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

