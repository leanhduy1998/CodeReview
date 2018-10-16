//
//  DefideDemoAppTests.swift
//  DefideDemoAppTests
//
//  Created by Duy Le 2 on 10/11/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import XCTest
@testable import DefideDemoApp



class DefideDemoAppTests: XCTestCase {
    var alert:Alert?
    
    override func setUp() {
        alert = Alert(viewcontroller: UIViewController())
    }

    override func tearDown() {
        alert = nil
    }

    func testIfAlertTitleIsEmpty(){
        XCTAssertNotEqual(alert?.getTitle(), "", "Title cannot be empty!")
    }
    
    func testIfAPIKeyIsNotEmpty(){
        XCTAssertNotEqual(Constant.apiKey, "", "API Key cannot be empty!")
    }
}
