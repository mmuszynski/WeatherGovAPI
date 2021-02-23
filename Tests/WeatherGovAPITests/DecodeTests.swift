//
//  File.swift
//  
//
//  Created by Mike Muszynski on 2/22/21.
//

import XCTest
@testable import WeatherGovAPI

class DecodeTests: XCTestCase {
    
    enum TestError: Error {
        case couldNotFindJSONData(named: String)
    }
    
    func jsonDataFromFile(named name: String) throws -> Data {
        guard let url = Bundle.module.url(forResource: name, withExtension: "json") else {
            throw TestError.couldNotFindJSONData(named: name)
        }
        return try Data(contentsOf: url)
    }
    
    func testDecodeErrorResult() {
        do {
            let data = try jsonDataFromFile(named: "ErrorResult")
            XCTAssertNoThrow(try JSONDecoder().decode(ErrorResult.self, from: data))
            
            let liveData = try jsonDataFromFile(named: "ErrorResultLive")
            XCTAssertNoThrow(try JSONDecoder().decode(ErrorResult.self, from: liveData))
        } catch {
            XCTFail("Unexpected Error: \(error)")
        }
    }
    
    ///https://api.weather.gov/points/39.7456,-97.0892
    func testDecodePointsResult() {
        do {
            let data = try jsonDataFromFile(named: "PointsResult")
            XCTAssertNoThrow(try JSONDecoder().decode(PointsResult.self, from: data))
        } catch {
            XCTFail("Unexpected Error: \(error)")
        }
    }
    
    ///The reporting stations for a given lat,long point
    ///https://api.weather.gov/points/35,-96/stations
    func testDecodePointStationsResult() {
        do {
            let data = try jsonDataFromFile(named: "PointStationsResult")
            let forecast = try JSONDecoder().decode(StationsResult.self, from: data)
            print(forecast)
        } catch {
            XCTFail("Unexpected Error: \(error)")
        }
    }
    
}
