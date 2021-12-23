//
//  JokeResponse.swift
//  ChuckNorris
//
//  Created by Bernardo Alecrim on 23/12/2021.
//

import Foundation

struct JokeResponse: Codable {
    let categories: [String]
    let iconURL: String
    let id: String
    let url: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case categories
        case id
        case url
        case value
    }
}
