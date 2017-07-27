//
//  ViewController.swift
//  CurrencyConversion-MVP
//
//  Created by Erik Weiss on 7/3/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

public protocol ViewControllerProtocol: class {
    func displayResult(resultingValue: Double)
}

class ViewController: UIViewController, ViewControllerProtocol {

    @IBOutlet weak var amountToConvert: UITextField!
    @IBOutlet weak var result: UILabel!
    
    var presenter: Presenter!   // IN MVP, VIEW OWNS AND SENDS ACTIONS TO PRESENTER
    
                                // VIEW DOES NOT KNOW ABOUT BUSINESS MODEL / SERVICES

    override func viewDidLoad() {
        presenter = Presenter(view: self)
    }
    
    @IBAction func convertClicked(_ sender: Any) {
        presenter.performConversion(sourceValue: Double.init(amountToConvert.text ?? "0") ?? 0)
    }

    public func displayResult(resultingValue: Double) {
        result.text = "\(resultingValue)"
    }
    
}

