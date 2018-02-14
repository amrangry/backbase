//
//  Coordinate.swift
//  CityCountryList
//
//  Created by Amr ELghadban on 2/14/18.
//  Copyright © 2018 Amr ELghadban. All rights reserved.
//

import Foundation

struct CoordinateModel {
    let lon:Double
    let lat:Double
}

extension CoordinateModel  {
    init?(json : JSONDictionary) {
        self.lat = json["lat"] as! Double
        self.lon = json["lon"] as! Double
    }
}
