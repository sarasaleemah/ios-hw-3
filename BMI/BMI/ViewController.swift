//
//  ViewController.swift
//  BMI
//
//  Created by Haya Saleemah on 9/26/20.
//  Copyright © 2020 fms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var state: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func calculate(_ sender: Any) {
        let height1 = Double(height.text!) ?? 0
         let weight1 = Double(weight.text!) ?? 0
        let result = weight1 / (height1 * height1)
        bmi.text = "\(result)"
        state.text = status(result: result)
        
    }
    func status (result : Double) -> String
    {
        if result < 20
        {
            return "thin 💀"
        }else if result < 25
        {
            return "normal 🏃🏻👍🏻"
        }else
        {
            return "fat 🤦🏻‍♂️"
        }
    }

}

