//
//  ViewModel.swift
//  CurrencyConversion-MVVM
//
//  Created by Erik Weiss on 7/3/17.
//  Copyright © 2017 Test. All rights reserved.
//

// NO UIKIT HERE
import Foundation
import RxSwift
import CurrencyConversion_Common

public class ViewModel {

    let conversionService: ConversionService
    let model: ConversionModel!  // IN MVVM, PRESENTER OWNS AND UPDATES BUSINESS MODEL
    
    public init(conversionService: ConversionService = ConversionService.sharedInstance) {
        self.conversionService = conversionService
        model = ConversionModel()
    }
    
    var sourceAmount = Variable<Double>(0.0)
    var sourceType = Variable<String>("USD")
    var destinationType = Variable<String>("GBP")
    var destinationAmount = Variable<Double>(0.0)
    
    @objc public func performConversion() {
        model.sourceAmount = self.sourceAmount.value
        conversionService.convert(model: model)
        self.destinationAmount.value = model.destinationAmount
    }
    
}
