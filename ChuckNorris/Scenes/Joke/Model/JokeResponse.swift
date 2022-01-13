//
//  JokeResponse.swift
//  ChuckNorris
//
//  Created by Marina Aguiar on 23/12/2021.
//

import Foundation

struct JokeResponse: Codable {
    let categories: [String]?
    let iconURL: String?
    let value: String?
    let url: String?

}

private extension JokeResponse {
    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case value, url, categories
    }
}
