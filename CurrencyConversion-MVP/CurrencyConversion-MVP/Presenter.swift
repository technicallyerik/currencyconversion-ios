//
//  Presenter.swift
//  CurrencyConversion-MVP
//
//  Created by Erik Weiss on 7/3/17.
//  Copyright © 2017 Test. All rights reserved.
//

// SHOULD NEVER IMPORT UIKIT
import Foundation
import CurrencyConversion_Common

public class Presenter {
    
    unowned let view: ViewControllerProtocol
    let conversionService: ConversionService
    let model: ConversionModel!  // IN MVP, PRESENTER OWNS AND UPDATES MODEL
    
    public init(view: ViewControllerProtocol,
                conversionService: ConversionService = ConversionService.sharedInstance) {
        self.view = view
        self.conversionService = conversionService
        model = ConversionModel()
    }
    
    public func performConversion(sourceValue: Double) {
        model.sourceAmount = sourceValue
        conversionService.convert(model: model)
        view.displayResult(resultingValue: model.destinationAmount)
    }
    
}
