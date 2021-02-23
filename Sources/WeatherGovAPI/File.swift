//
//  File.swift
//  
//
//  Created by Mike Muszynski on 2/22/21.
//

import Foundation

struct ForecastResult: Codable {
    var type: String
    var geometry: GeoJSONGeometry
}
