//
//  MarvelClass.swift
//  Marvel Heroes
//
//  Created by Letícia on 06/11/20.
//

import Foundation

struct MarvelResult: Codable {
    var code: String
    var status: String?
    let data: MarvelData
}

struct MarvelData: Codable {
    let offset: Int
    let limit: Int
    var total: Int
    var count: Int
    var results: [Hero]
}

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let urls: [HeroUrl]
}

struct Thumbnail: Codable {
    let path: String
    let tbExt: String
    
    var url: String {
        return path + "." + tbExt
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case tbExt = "extension"
    }
}

struct HeroUrl: Codable {
    let type: String?
    let url: String?
}
