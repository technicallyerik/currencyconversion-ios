//
//  ConversionService.swift
//  CurrencyConversion-Common
//
//  Created by Erik Weiss on 7/25/17.
//  Copyright © 2017 Test. All rights reserved.
//

import Foundation

open class ConversionService {
    
    private init() { }
    
    open static let sharedInstance = ConversionService()
    
    open func convert(model: ConversionModel) {
        model.destinationAmount = model.sourceAmount * 0.77
    }
    
}
