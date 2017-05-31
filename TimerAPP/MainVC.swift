//
//  ViewController.swift
//  TimerAPP
//
//  Created by Mohamed El Naggar on 4/16/17.
//  Copyright © 2017 Mohamed El Naggar. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var timer = Timer()

    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* ----- Default Status for Buttons ----- */
        startButton.isHidden = false
        resetButton.isHidden = true
        pauseButton.isHidden = true
    }
    
    var displayTime: Int {
        get {
            return Int(counterLabel.text!)!
        }
        set {
            counterLabel.text = "\(newValue)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startCount(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainVC.Counter), userInfo: nil, repeats: true)
        
        startButton.isHidden = true
        startButton.setTitleColor(UIColor.gray, for: .disabled)
        pauseButton.isHidden = false
        resetButton.isHidden = false
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        timer.invalidate()
        displayTime = 0
        
        startButton.isHidden = false
        pauseButton.isHidden = true
        pauseButton.setTitleColor(UIColor.gray, for: .disabled)
        resetButton.isHidden = true
        resetButton.setTitleColor(UIColor.gray, for: .disabled)
    }
    
    @IBAction func pauseCounter(_ sender: Any) {
        timer.invalidate()
        
        startButton.isHidden = false
        pauseButton.isHidden = true
        pauseButton.setTitleColor(UIColor.gray, for: .disabled)
        resetButton.isHidden = false
    }
    
    
    func Counter() {
        displayTime += 1
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        let deviceOrientation = UIDevice.current.orientation
        let left = UIDeviceOrientation.landscapeLeft
        let right = UIDeviceOrientation.landscapeRight
        
        if deviceOrientation == left || deviceOrientation == right {
            print("1")
            mainStackView.axis = UILayoutConstraintAxis.horizontal
            buttonsStackView.axis = UILayoutConstraintAxis.vertical
        } else {
            print("2")
            mainStackView.axis = UILayoutConstraintAxis.vertical
            buttonsStackView.axis = UILayoutConstraintAxis.horizontal
        }
        
    }
    
    
}

