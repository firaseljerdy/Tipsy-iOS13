//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var totalPeopleText: UILabel!
    
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var billInputText: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var currentPercentageTip: Float = 0.0
    var totalBill: String = ""
    var totalPeople: String = ""
        
    var tippingBrain = TippingBrain()
    let numberFormatter = NumberFormatter()
    
    
    @IBAction func onTipPercentagePress(_ sender: UIButton) {
        switch sender.currentTitle {
        case "0%":
            zeroPercentButton.isSelected = true
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
            currentPercentageTip = 0.0
        case "10%":
            tenPercentButton.isSelected = true
            zeroPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
            currentPercentageTip = 10.0
        case "20%":
            twentyPercentButton.isSelected = true
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = false
            currentPercentageTip = 20.0
        default:
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
            currentPercentageTip = 0.0
        }
    }
    
    @IBAction func onStepperPress(_ sender: UIStepper) {
        let formattedString = String(format: "%.0f", sender.value)
        totalPeopleText.text = formattedString
        totalPeople = formattedString
    }
    
    @IBAction func onCalculatePress(_ sender: UIButton) {
        totalBill = billInputText.text ?? "0.0"
        let billStringToFloat = numberFormatter.number(from: totalBill)
        let billFloatValue = billStringToFloat?.floatValue ?? 0.0
        
        let totalPeopleStringToFloat = numberFormatter.number(from: totalPeople)
        let peopleFloatValue = totalPeopleStringToFloat?.floatValue ?? 2.0
        
        print(peopleFloatValue)
        
        tippingBrain.calculateTotalBill(bill: billFloatValue, amountPeople: peopleFloatValue, tip: currentPercentageTip)
        performSegue(withIdentifier: "goToResult", sender: self)
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalPerPerson = tippingBrain.getTotalResult()
            destinationVC.referenceText = tippingBrain.getDescription()
            destinationVC.amountPeople = tippingBrain.getAmountPeople()
        }
    }
}


