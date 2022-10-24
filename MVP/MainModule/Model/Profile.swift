//
//  Profile.swift
//  MVP
//
//  Created by Dmitriy Eni on 24.10.2022.
//

import Foundation
import ObjectMapper

class Content: Mappable {
    var results = [Profile]()
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        results     <- map["results"]
    }
}

class Profile: Mappable {
    var id: Int = 0
    var name: String = ""
    var status: String = ""
    var species: String = ""
    var type: String = ""
//    var gender: String
//    var origin:String
//    var location: String
    var image: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        status      <- map["status"]
        species     <- map["species"]
        type        <- map["type"]
        image       <- map["image"]
    }
}
