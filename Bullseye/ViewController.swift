//
//  ViewController.swift
//  Bullseye
//
//  Created by Keri Clowes on 2/9/16.
//  Copyright © 2016 Keri Clowes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        
        score += points
        
        if difference == 0 {
            title = "Perfect"
        } else if difference < 10 {
            title = "You almost had it!"
        } else {
            title = "Not even close :-("
        }
        
        
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok!", style: .Default, handler: {
            action in
            self.startNewRound()
            self.updateLabels()
        })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        updateLabels()
    }
    
    func startNewRound() {
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        round += 1
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

