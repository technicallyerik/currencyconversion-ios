//
//  ConversionModel.swift
//  CurrencyConversion-Common
//
//  Created by Erik Weiss on 7/25/17.
//  Copyright © 2017 Test. All rights reserved.
//

import Foundation

open class ConversionModel {
    
    public init() {
        
    }
    
    open var sourceAmount: Double = 0
    open var sourceType: String = "USD"
    open var destinationType: String = "GBP"
    open var destinationAmount: Double = 0
    
}
