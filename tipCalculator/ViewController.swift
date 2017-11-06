//
//  ViewController.swift
//  tipCalculator
//
//  Created by Vinnie Chen on 12/29/16.
//  Copyright © 2016 Vinnie Chen. All rights reserved.
//

import UIKit

var tipPercentages = [0.15, 0.20, 0.25]

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var background: UIView!
    var colors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the Navigation Bar
        let light =
            UIColor(red:0.22, green:0.68, blue:0.78, alpha:1.0)
        let med = UIColor(red:0.05, green:0.64, blue:0.76, alpha:1.0)
        let dark = UIColor(red:0.03, green:0.54, blue:0.65, alpha:1.0)
        colors = [light, med, dark]
        background.backgroundColor = light
//        self.navigationController?.isNavigationBarHidden = true;
       self.navigationController?.setNavigationBarHidden(true, animated: true)
//        self.navigationController?.setToolbarHidden(true, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // hides keyboard on tap
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    // calculate tip once number entered in text field
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let color = colors[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip) // %.2f two decimal places
        totalLabel.text = String(format: "$%.2f", total)
        background.backgroundColor = color
    }
}

