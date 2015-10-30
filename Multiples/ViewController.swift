//
//  ViewController.swift
//  Multiples
//
//  Created by Shane Lupton on 10/30/15.
//  Copyright © 2015 Shane Lupton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Properties
    var numToMultiply = 0
    var currentValue = 0
    var totalAmount = 0
    var addPress = 0
    let addPressmax = 10
    
    //Outlets
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var numberTxt: UITextField!
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var returnBtn: UIButton!
    
    //Actions
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
    
        if numberTxt.text != nil && numberTxt.text != "" {
            
            logo.hidden = true
            playBtn.hidden = true
            numberTxt.hidden = true
            
            textLabel.hidden = false
            addBtn.hidden = false
            returnBtn.hidden = true
            
            numToMultiply = Int(numberTxt.text!)!
            
            textLabel.text = "Press Add to add"
            updateTotalAmount()
            
            
        }
    
    }
    
    @IBAction func onAddButtonPressed(sender: UIButton!) {

        
        updateTotalAmount()
        
        textLabel.text = "\(currentValue) + \(numToMultiply) = \(totalAmount)"
        currentValue = numToMultiply + currentValue
        
        addPress++
        maxAddEnd()
        
    }
    
    @IBAction func onReturnButtonPress(sender: UIButton!) {
        restartApp()
    }
    
    //Functions
    
    func updateTotalAmount() {
        totalAmount = numToMultiply + currentValue
        
    }
    
    func pressMax() -> Bool {
        if addPress >= addPressmax {
            return true
        } else {
            return false
        }
    }

    func restartApp() {
        logo.hidden = false
        playBtn.hidden = false
        numberTxt.hidden = false
            
        textLabel.hidden = true
        addBtn.hidden = true
        returnBtn.hidden = true
        
        addPress = 0
        currentValue = 0
        numToMultiply = 0
        totalAmount = 0
        numberTxt.text = ""
        
    }
    
    func maxAddEnd() {
        if pressMax() {
        addBtn.hidden = true
        returnBtn.hidden = false
        }
    }
    
    
    
    
    
}

