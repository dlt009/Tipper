//
//  ViewController.swift
//  tipper
//
//  Created by David Tan on 1/1/18.
//  Copyright © 2018 DavidTan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sizeField: UITextField!
    @IBOutlet weak var yourTotalLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func calculateTip(_ sender: Any) {
        let percentages = [0.1, 0.15, 0.2]
        let bill = Double(billField.text!) ?? 0
        let size = Double(sizeField.text!) ?? 0
        let tip = bill * percentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let yourTotal = total/size

        
        if (size == 0) {
            yourTotalLabel.text = ""
            tipLabel.text = ""
            totalLabel.text = ""
            errorLabel.text = "Must Enter Part Size of 1 or More!!"
        }
        else {
            yourTotalLabel.text = String(format: "$%.2f", yourTotal)
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            errorLabel.text = ""
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.keyboardType = UIKeyboardType.decimalPad
        sizeField.keyboardType = UIKeyboardType.numberPad
        
        sizeField.text = "1"
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "myInt")
        tipControl.selectedSegmentIndex = intValue
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

