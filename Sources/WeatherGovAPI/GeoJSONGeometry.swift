//
//  File 2.swift
//  
//
//  Created by Mike Muszynski on 2/22/21.
//

import Foundation

enum GeoJSONGeometry: Codable {
    case point(_ coordinates: [Double])
    case polygon(_ coordinates: [[Double]])
    
    private var _typeName: String {
        switch self {
        case .point(_):
            return "point"
        case .polygon(_):
            return "polygon"
        }
    }
    
    enum CodingKeys: CodingKey {
        case type
        case coordinates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type.lowercased() {
        case "point":
            let coordinates = try container.decode([Double].self, forKey: .coordinates)
            self = .point(coordinates)
        case "polygon":
            let coordinates = try container.decode([[Double]].self, forKey: .coordinates)
            self = .polygon(coordinates)
        default:
            fatalError("Unhandled Type")
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self._typeName, forKey: .type)
        
        switch self {
        case .point(let coordinates):
            try container.encode(coordinates, forKey: .coordinates)
        case .polygon(let coordinates):
            try container.encode(coordinates, forKey: .coordinates)
        }
    }
}
