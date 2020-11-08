//
//  Service.swift
//  Marvel Heroes
//
//  Created by Letícia on 06/11/20.
//

import Foundation
import Alamofire
import SwiftHash

class Service {
    
    static private var baseUrl = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "d74876aed220ccb77e0dc11295606ea513f23cb7"
    static private let publicKey = "330d36db4dc523b5bb99b32206ad008e"
    static private var limit = 50
    
    class func fetchHeroes(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void){
        
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))"
        } else {
            startsWith = ""
        }
        
        let apiURL = baseUrl + "offset=\(offset)&limit=\(limit)&" + startsWith + credentials()
        print(apiURL)
        
        AF.request(apiURL).responseJSON { (response) in
            guard let data = response.data,
                let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
                marvelInfo.code == 200 else {
                    onComplete(nil)
                    return
            }
            onComplete(marvelInfo)
        }
    }
    
    private class func credentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
