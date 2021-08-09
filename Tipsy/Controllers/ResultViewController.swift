//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Firas El Jerdy on 09/08/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var billText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    
    var totalPerPerson: Float = 0.0
    var amountPeople: Float?
    var referenceText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billText.text = String(totalPerPerson)
        descriptionText.text = referenceText
    }
    
    @IBAction func onRecalculatePress(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
