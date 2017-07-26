//
//  Presenter.swift
//  CurrencyConversion-MVP
//
//  Created by Erik Weiss on 7/3/17.
//  Copyright © 2017 Test. All rights reserved.
//

// SHOULD NEVER IMPORT UIKIT
import Foundation

public class Presenter {
    
    unowned let view: ViewControllerProtocol
    let model: ConversionModel!  // IN MVP, PRESENTER OWNS AND UPDATES MODEL
    
    public init(view: ViewControllerProtocol) {
        self.view = view
        model = ConversionModel()
    }
    
    public func performConversion(sourceValue: Double) {
        model.sourceAmount = sourceValue
        ConversionService.sharedInstance.convert(model: model)
        view.displayResult(resultingValue: model.destinationAmount)
    }
    
}
