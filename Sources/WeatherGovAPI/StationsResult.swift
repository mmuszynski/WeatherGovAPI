//
//  File.swift
//  
//
//  Created by Mike Muszynski on 2/22/21.
//

import Foundation

/// The stations result for a given Lat,Long point
///https://api.weather.gov/points/lat,long/stations
struct StationsResult: Codable {
    var type: String
    var features: [FeatureResult]
    var observationStations: [String]
}

struct FeatureResult: Codable {
    var id: String
    var type: String
    var geometry: GeoJSONGeometry
    var properties: Properties
    
    struct Properties: Codable {
        var id: String
        var type: String
        var elevation: WeatherGovMeasurement
        var stationIdentifier: String
        var name: String
        var timeZone: String
        var forecast: String
        var county: String
        var fireWeatherZone: String
        
        enum CodingKeys: String, CodingKey {
            case id = "@id"
            case type = "@type"
            case elevation
            case stationIdentifier
            case name
            case timeZone
            case forecast
            case county
            case fireWeatherZone
        }
    }
}
