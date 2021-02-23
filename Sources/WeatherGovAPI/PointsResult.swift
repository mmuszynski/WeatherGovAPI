//
//  File.swift
//  
//
//  Created by Mike Muszynski on 2/22/21.
//

import Foundation

/// A result from the endpoint that translates latitude and longitude coordinates into office and grid information for use in the weather api
///https://api.weather.gov/points/lat,long/
struct PointsResult: Codable {
    //var context:
    var id: String
    var type: String
    var geometry: GeoJSONGeometry
    var properties: Properties
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case geometry
        case properties
    }
    
    struct Properties: Codable {
        var id: String
        var type: String
        var cwa: String
        var forecastOffice: String
        var gridId: String
        var gridX: Int
        var gridY: Int
        var forecast: String
        var forecastHourly: String
        var forecastGridData: String
        var observationStations: String
        var relativeLocation: RelativeLocation
        var forecastZone: String
        var county: String
        var fireWeatherZone: String
        var timeZone: String
        var radarStation: String
        
        enum CodingKeys: String, CodingKey {
            case id = "@id"
            case type = "@type"
            case cwa
            case forecastOffice
            case gridId
            case gridX
            case gridY
            case forecast
            case forecastHourly
            case forecastGridData
            case observationStations
            case relativeLocation
            case forecastZone
            case county
            case fireWeatherZone
            case timeZone
            case radarStation
        }
        
        struct RelativeLocation: Codable {
            var type: String
            var geometry: GeoJSONGeometry
            var properties: Properties
            
            struct Properties: Codable {
                var city: String
                var state: String
                var distance: WeatherGovMeasurement
                var bearing: WeatherGovMeasurement
            }
        }
    }
}

struct WeatherGovMeasurement: Codable {
    var value: Double
    var unitCode: String
}
