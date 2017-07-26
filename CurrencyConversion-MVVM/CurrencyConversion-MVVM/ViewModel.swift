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

public class ViewModel {

    var sourceAmount = Variable<Double>(0.0)
    var sourceType = Variable<String>("USD")
    var destinationType = Variable<String>("GBP")
    var destinationAmount = Variable<Double>(0.0)
    
    // USUALLY THE VIEW MODEL WOULD OWN AND UPDATE A BUSINESS MODEL
    
    @objc public func performConversion() {
        destinationAmount.value = ConversionService.sharedInstance.convert(sourceAmount: sourceAmount.value)
    }
    
}
