//
//  ViewController.swift
//  window-shopper
//
//  Created by Nuansa Lembayung on 30/7/17.
//  Copyright © 2017 Inno Ideas. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var wageTxt: CurrencyTxtField!
    @IBOutlet weak var priceTxt: CurrencyTxtField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcBtn = UIButton(frame: CGRect(x:0, y:0, width:view.frame.size.width, height:60))
        calcBtn.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        calcBtn.setTitle("Calculate", for:.normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for:.normal)
        calcBtn.addTarget(self, action:#selector(MainVC.calculate), for:.touchUpInside)
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
        
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
    }
    
    @objc func calculate() {
        if let wageText = wageTxt.text, let priceText = priceTxt.text {
            if let wage = Double(wageText), let price = Double(priceText) {
                view.endEditing(true)
                resultLbl.isHidden = false
                hoursLbl.isHidden = false
                let result = Wage.getHours(forWage: wage, andPrice: price)
                resultLbl.text = "\(result)"
                if result == 1 {
                    hoursLbl.text = "hour"
                } else {
                    hoursLbl.text = "hours"
                }
            }
        }
    }
    
    @IBAction func clearCalculatorPressed(_ sender: Any) {
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

