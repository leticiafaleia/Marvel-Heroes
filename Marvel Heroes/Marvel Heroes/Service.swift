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
    
    static private var baseUrl = "https://gateway.marvel.com:443/v1/public/characters"
    static private let privateKey = "4dacddd2fc958262ab6e15830910d432de6cde7b"
    static private let publicKey = "620a7824293e0a833877dc1f2c6a141a"
    static private var limit = 50
    
    class func fetchHeroes(name: String?, page: Int = 0, onComplete: @escaping (MarvelResult?) -> Void){
        
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        
        let apiURL = baseUrl + "offset=\(offset)&limit=\(limit)&" + startsWith + credentials()
        print(apiURL)
        
        AF.request(apiURL).responseJSON { (response) in
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            do {
                let marvelInfo = try JSONDecoder().decode(MarvelResult.self, from: data)
                onComplete(marvelInfo)
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
        }
    }
    
    private class func credentials() -> String {
        let ts = Date().timeIntervalSinceNow
        let timeStamp = String(ts)
        let hash = (timeStamp+privateKey+publicKey)
        print(hash, "hash sem md5")
        let hashMD5 = MD5(hash).lowercased()
        print(hashMD5, "hash com md5")
        return "ts=\(timeStamp)&apiKey=\(publicKey)&hash=\(hashMD5)"
    }
    
}
