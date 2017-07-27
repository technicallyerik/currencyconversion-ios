//
//  CurrencyConversion_MVVMTests.swift
//  CurrencyConversion-MVVMTests
//
//  Created by Erik Weiss on 7/26/17.
//  Copyright © 2017 Test. All rights reserved.
//

import XCTest
import RxSwift
@testable import CurrencyConversion_Common
@testable import CurrencyConversion_MVVM

class CurrencyConversion_MVVMTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConvertClicked_ShouldReturnResult_FromService() {
        // Setup
        let mockService = ConversionService.sharedInstance // This should actually be a mocked instance
        let vm = ViewModel(conversionService: mockService)
        vm.sourceAmount = Variable<Double>(10.0)
        
        // Execute
        vm.performConversion()
        
        // Verify
        XCTAssertTrue(vm.destinationAmount.value == 7.7, "Destination amount not set to correct value.")
    }
    
}
