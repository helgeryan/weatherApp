//
//  weatherUITests.swift
//  weatherUITests
//
//  Created by Ryan Helgeson on 2/8/24.
//

import XCTest

final class weatherUITests: XCTestCase {
    let app = XCUIApplication()
    
    func testHappyPath() throws {
        app.launch()
        
        // Tap the search bar
        let searchField = XCUIApplication()/*@START_MENU_TOKEN@*/.textFields["weatherSearchtextField"]/*[[".textFields[\"Enter a location (name or zip)\"]",".textFields[\"weatherSearchtextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        searchField.tap()
        
        // Delete "Chanhassen"
        let deleteKey = app/*@START_MENU_TOKEN@*/.keyboards.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()

        // Enter Minnetonka search
        searchField.typeText("Minnetonka")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Confirm fetched
        XCTAssertTrue(XCUIApplication().staticTexts["Weather in Minnetonka"].exists)
    }    
    
    func testErrorPath() throws {
        app.launch()
        
        // Tap the search bar
        let searchField = XCUIApplication()/*@START_MENU_TOKEN@*/.textFields["weatherSearchtextField"]/*[[".textFields[\"Enter a location (name or zip)\"]",".textFields[\"weatherSearchtextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        searchField.tap()

        // Type gibberish
        searchField.typeText("abcdefg")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Confirm error
        XCTAssertTrue(XCUIApplication().staticTexts["Unable to find weather data for this location at this time. Please try again."].exists)
    }
}
