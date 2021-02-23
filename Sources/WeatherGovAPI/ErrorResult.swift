//
//  File.swift
//  
//
//  Created by Mike Muszynski on 2/22/21.
//

import Foundation

/*
 Example error
 
 {
   "title": "Unexpected Problem",
   "type": "https://api.weather.gov/problems/UnexpectedProblem",
   "status": 500,
   "detail": "An unexpected problem has occurred.",
   "instance": "https://api.weather.gov/requests/493c3a1d-f87e-407f-ae2c-24483f5aab63",
   "correlationId": "493c3a1d-f87e-407f-ae2c-24483f5aab63"
 }
 */

struct ErrorResult: Codable {
    var title: String
    var type: String
    var status: Int
    var detail: String
    var instance: String
    var correlationId: String
}
