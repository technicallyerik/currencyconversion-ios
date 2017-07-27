//
//  CurrencyConversion_MVPTests.swift
//  CurrencyConversion-MVPTests
//
//  Created by Erik Weiss on 7/26/17.
//  Copyright © 2017 Test. All rights reserved.
//

import XCTest
@testable import CurrencyConversion_Common
@testable import CurrencyConversion_MVP

class CurrencyConversion_MVPTests: XCTestCase {
    
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
        let mockView = MockViewController()
        var displayedResult: Double?
        mockView.displayResultCalled = {
            (result:Double) in
            displayedResult = result
        }
        let p = Presenter(view: mockView, conversionService: mockService)

        // Execute
        p.performConversion(sourceValue: 10.0)
        
        // Verify
        XCTAssertTrue(displayedResult == 7.7, "Label not updated with proper value.")
    }

}

class MockViewController: ViewControllerProtocol {
    var displayResultCalled: ((Double) -> ())?
    
    func displayResult(resultingValue: Double) {
        displayResultCalled?(resultingValue)
    }
}
