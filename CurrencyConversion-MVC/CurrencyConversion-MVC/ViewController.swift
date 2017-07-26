//
//  ViewController.swift
//  CurrencyConversion-MVC
//
//  Created by Erik Weiss on 7/3/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import CurrencyConversion_Common

class ViewController: UIViewController {

    @IBOutlet weak var amountToConvert: UITextField!
    @IBOutlet weak var result: UILabel!
    
    var conversionService: ConversionService
    
    var model: ConversionModel!  // IN MVC, CONTROLLER OWNS AND UPDATES MODEL
    
    init(conversionService: ConversionService = ConversionService.sharedInstance) {
        self.conversionService = conversionService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.conversionService = ConversionService.sharedInstance
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        model = ConversionModel()
    }
    
    @IBAction func convertClicked(_ sender: Any) {
        model.sourceAmount = Double.init(amountToConvert.text ?? "0") ?? 0
        conversionService.convert(model: model)
        result.text = "\(model.destinationAmount)"
    }

}
