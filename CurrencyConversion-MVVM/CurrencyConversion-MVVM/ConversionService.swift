//
//  ConversionService.swift
//  CurrencyConversion-MVVM
//
//  Created by Erik Weiss on 7/3/17.
//  Copyright © 2017 Test. All rights reserved.
//

import Foundation

public class ConversionService {
    
    private init() { }
    
    public static let sharedInstance = ConversionService()
    
    public func convert(sourceAmount: Double) -> Double {
        return sourceAmount * 0.77
    }
    
}
