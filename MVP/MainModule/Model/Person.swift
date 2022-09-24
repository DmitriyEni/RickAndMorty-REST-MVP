//
//  Person.swift
//  MVP
//
//  Created by Dmitriy Eni on 23.09.2022.
//

import Foundation

struct Person: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
//    let origin:String
//    let location: String
    let image: String?
//    let episode: Array<String>
//    let url: String
    let created: String
}
