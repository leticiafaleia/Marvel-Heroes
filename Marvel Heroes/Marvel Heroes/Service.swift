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
    static private var baseUrl = "https://gateway.marvel.com/v1/public/characters%22"
    static private let privateKey = "4dacddd2fc958262ab6e15830910d432de6cde7b"
    static private let publicKey = "620a7824293e0a833877dc1f2c6a141a"
    static private var limit = 50
    
    private class func credentials() -> String {
        var timeStamp = String(Date().timeIntervalSince1970)
        var hash = MD5(timeStamp+privateKey+publicKey).lowercased()
        return "ts=\(timeStamp)&apiKey=\(publicKey)&hash=\(hash)"
    }
    
    class func fetchHeroes(name: String?, page: Int = 0, onComplete: @escaping (MarvelResult?) -> Void){
        var offset = page * limit
        var startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        
        let apiURL = baseUrl + "offset=\(offset)&limit=\(limit)&" + startsWith +  credentials()
        
        AF.request(apiURL).responseJSON { (response) in
            guard let data = response.data,
                  let marvelInfo = try? JSONDecoder().decode(MarvelResult.self, from: data),
                  marvelInfo.code == 200 else {
                  onComplete(nil)
                  return
            }
            onComplete(marvelInfo)
            }
        }
    }
