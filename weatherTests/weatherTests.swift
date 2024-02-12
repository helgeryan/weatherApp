//
//  weatherTests.swift
//  weatherTests
//
//  Created by Ryan Helgeson on 2/8/24.
//

import XCTest
@testable import weather

final class weatherTests: XCTestCase {

    func testTempString() throws {
        let double: Double = 80.0
        XCTAssertEqual("80\(Constants.degrees)", double.getTempString())
    }

    func testAttributedString() throws {
        let double: Double =  70.0
        let value = "70\(Constants.degrees)"
        var valueString: AttributedString = AttributedString(value)
        valueString.font = .systemFont(ofSize: 30, weight: .bold)
        
        var farenheit: AttributedString = AttributedString("F")
        farenheit.font = .systemFont(ofSize: 22, weight: .bold)
        
        var celsius: AttributedString = AttributedString("C")
        celsius.font = .systemFont(ofSize: 22, weight: .bold)
        
        // Check both temp signs
        XCTAssertEqual(valueString + farenheit, double.getTempAttributedString(isFarenheit: true))
        XCTAssertEqual(valueString + celsius, double.getTempAttributedString(isFarenheit: false))
        
        // Make sure they are not equal to the other as well
        XCTAssertNotEqual(valueString + farenheit, double.getTempAttributedString(isFarenheit: false))
        XCTAssertNotEqual(valueString + celsius, double.getTempAttributedString(isFarenheit: true))
    }
    
    func testEpochToWeekDay() throws {
        let epochTime: Int = 1707761083
        let epochTime2: Int = 1707847483
        let epochTime3: Int = 1707933883
        let epochTime4: Int = 1708020283
        let epochTime5: Int = 1708106683
        let epochTime6: Int = 1708193083
        let epochTime7: Int = 1708279483
        
        XCTAssertEqual("Mon", epochTime.getEpochToWeekdayText())
        XCTAssertEqual("Tue", epochTime2.getEpochToWeekdayText())
        XCTAssertEqual("Wed", epochTime3.getEpochToWeekdayText())
        XCTAssertEqual("Thu", epochTime4.getEpochToWeekdayText())
        XCTAssertEqual("Fri", epochTime5.getEpochToWeekdayText())
        XCTAssertEqual("Sat", epochTime6.getEpochToWeekdayText())
        XCTAssertEqual("Sun", epochTime7.getEpochToWeekdayText())
    }
    
    func testEpochToHour() throws {
        let epochTime: Int = 1708214400
        let epochTime2: Int = 1708218000
        let epochTime3: Int = 1708221600
        let epochTime4: Int = 1708225200
        let epochTime5: Int = 1708228800
        let epochTime6: Int = 1708232400
        let epochTime7: Int = 1708236000
        let epochTime8: Int = 1708239600
        let epochTime9: Int = 1708243200
        let epochTime10: Int = 1708246800
        let epochTime11: Int = 1708250400
        let epochTime12: Int = 1708254000
        let epochTime13: Int = 1708257600
        let epochTime14: Int = 1708261200
        let epochTime15: Int = 1708264800
        let epochTime16: Int = 1708268400
        let epochTime17: Int = 1708272000
        let epochTime18: Int = 1708275600
        let epochTime19: Int = 1708279200
        let epochTime20: Int = 1708282800
        let epochTime21: Int = 1708286400
        let epochTime22: Int = 1708290000
        let epochTime23: Int = 1708293600
        let epochTime24: Int = 1708297200
        
        XCTAssertEqual("12AM", epochTime.getEpochToHourText())
        XCTAssertEqual("1AM", epochTime2.getEpochToHourText())
        XCTAssertEqual("2AM", epochTime3.getEpochToHourText())
        XCTAssertEqual("3AM", epochTime4.getEpochToHourText())
        XCTAssertEqual("4AM", epochTime5.getEpochToHourText())
        XCTAssertEqual("5AM", epochTime6.getEpochToHourText())
        XCTAssertEqual("6AM", epochTime7.getEpochToHourText())
        XCTAssertEqual("7AM", epochTime8.getEpochToHourText())
        XCTAssertEqual("8AM", epochTime9.getEpochToHourText())
        XCTAssertEqual("9AM", epochTime10.getEpochToHourText())
        XCTAssertEqual("10AM", epochTime11.getEpochToHourText())
        XCTAssertEqual("11AM", epochTime12.getEpochToHourText())
        XCTAssertEqual("12PM", epochTime13.getEpochToHourText())
        XCTAssertEqual("1PM", epochTime14.getEpochToHourText())
        XCTAssertEqual("2PM", epochTime15.getEpochToHourText())
        XCTAssertEqual("3PM", epochTime16.getEpochToHourText())
        XCTAssertEqual("4PM", epochTime17.getEpochToHourText())
        XCTAssertEqual("5PM", epochTime18.getEpochToHourText())
        XCTAssertEqual("6PM", epochTime19.getEpochToHourText())
        XCTAssertEqual("7PM", epochTime20.getEpochToHourText())
        XCTAssertEqual("8PM", epochTime21.getEpochToHourText())
        XCTAssertEqual("9PM", epochTime22.getEpochToHourText())
        XCTAssertEqual("10PM", epochTime23.getEpochToHourText())
        XCTAssertEqual("11PM", epochTime24.getEpochToHourText())
    }
    
    @MainActor
    func testRefreshWithError() async throws {
        let manager = WeatherManager(service: MockWeatherService(forceError: true))
        
        await manager.refresh(with: "Chanhassen")
        
        XCTAssertNil( manager.currentWeather)
        XCTAssertNil( manager.forecastedWeather)
        XCTAssertNotNil( manager.error)
        
    }
    
    @MainActor
    func testRefreshWithSuccess() async throws {
        let manager = WeatherManager(service: MockWeatherService(forceError: false))
        
        await manager.refresh(with: "Chanhassen")
        
        XCTAssertNotNil( manager.currentWeather)
        XCTAssertNotNil( manager.forecastedWeather)
        XCTAssertNil( manager.error)
        
        
    }
}
