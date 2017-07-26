//
//  CurrencyConversion_MVCTests.swift
//  CurrencyConversion-MVCTests
//
//  Created by Erik Weiss on 7/25/17.
//  Copyright © 2017 Test. All rights reserved.
//

import XCTest
@testable import CurrencyConversion_Common
@testable import CurrencyConversion_MVC

class CurrencyConversion_MVCTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConvertClicked_ShouldReturnResult_FromService() {
        // Setup
        let mockService = ConversionService.sharedInstance // This should actually be a mocked instance
        let vc = ViewController(conversionService: mockService)
        vc.viewDidLoad()        // ANNOYING
        let label = UILabel()   // Store as variable first since ViewController holds weak references
        vc.result = label       // MORE ANNOYING
        let textField = UITextField()
        vc.amountToConvert = textField
        vc.amountToConvert.text = "10"
        
        // Execute
        vc.convertClicked(UIButton())
        
        // Verify
        XCTAssertTrue(vc.result.text == "7.7", "Label not updated with proper value.")
    }
    
}
