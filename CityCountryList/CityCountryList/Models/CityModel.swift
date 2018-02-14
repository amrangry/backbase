//
//  City.swift
//  CityCountryList
//
//  Created by Amr ELghadban on 2/14/18.
//  Copyright © 2018 Amr ELghadban. All rights reserved.
//

import Foundation


struct CityModel {
    let country : String
    let name : String
    let id : Int
    let coord : CoordinateModel
}


extension CityModel {
    init?(json : JSONDictionary) {
        
        self.country = json["country"] as! String
        self.name = json["name"] as! String
        self.id = json["_id"] as! Int
        let coordDict = json["coord"] as! JSONDictionary
        self.coord = CoordinateModel.init(json: coordDict)!
       
    }
}
