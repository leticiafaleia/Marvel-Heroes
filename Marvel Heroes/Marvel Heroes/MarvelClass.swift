//
//  MarvelClass.swift
//  Marvel Heroes
//
//  Created by Letícia on 06/11/20.
//

import Foundation

struct MarvelResult: Codable {
    var code: Int
    var status: String
    var data: MarvelData
}

struct MarvelData: Codable {
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [Hero]
}

struct Hero: Codable {
    var id: Int
    var name: String
    var about: String
    var thumbnail: Thumbnail
    var urls: [HeroUrl]
}

struct Thumbnail: Codable {
    var path: String
    var thumbnailExtension: String
    
    var url: String {
        return path + "." + thumbnailExtension
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

struct HeroUrl: Codable {
    var type: String
    var url: String
}
