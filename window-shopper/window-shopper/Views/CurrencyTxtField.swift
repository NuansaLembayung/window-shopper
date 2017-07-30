//
//  CurrencyTxtField.swift
//  window-shopper
//
//  Created by Nuansa Lembayung on 30/7/17.
//  Copyright © 2017 Inno Ideas. All rights reserved.
//

import UIKit

@IBDesignable
class CurrencyTxtField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size:CGFloat = 20
        let currencyLbl = UILabel(frame: CGRect(x:5, y: (frame.size.height/2)-size/2, width:size, height: size))
        currencyLbl.backgroundColor = #colorLiteral(red: 0.767647326, green: 0.7712020278, blue: 0.7798857093, alpha: 0.3755083476)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        currencyLbl.layer.cornerRadius = 5.0
        currencyLbl.clipsToBounds = true
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        
        currencyLbl.text = formatter.currencySymbol
        addSubview(currencyLbl)
    }
    
    override func prepareForInterfaceBuilder() {
        customiseView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        customiseView()
    }
    
    func customiseView() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2500550176)
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = 5.0
        textAlignment = .center
        clipsToBounds = true
        
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            attributedPlaceholder = place
        }
    }
}
