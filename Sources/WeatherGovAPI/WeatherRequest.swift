//
//  File.swift
//  
//
//  Created by Mike Muszynski on 2/22/21.
//

import Foundation

struct WeatherRequest {
    
    /* Available Formats:
     GeoJSON: application/geo+json
     
     Currently Unsupported:
     JSON-LD: application/ld+json
     DWML: application/vnd.noaa.dwml+xml
     OXML: application/vnd.noaa.obs+xml
     CAP: application/cap+xml
     ATOM: application/atom+xml
     */
    
    var baseURL: URL {
        URL(string: "https://api.weather.gov")!
    }
    
    /*
     An example url
    https://api.weather.gov/gridpoints/{office}/{grid X},{grid Y}/forecast
    */
    
    /*
     A request for the office and grid information
     https://api.weather.gov/points/{latitude},{longitude}
     */
    
    var url: URL? {
        let components = URLComponents()
        return components.url(relativeTo: self.baseURL)
    }
    
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.setValue("com.mmuszynski.WeatherGovAPI, iosmmuszynski@gmail.com", forHTTPHeaderField: "User-Agent")
        request.setValue("application/geo+json", forHTTPHeaderField: "Accept")
        return request
    }
    
}
