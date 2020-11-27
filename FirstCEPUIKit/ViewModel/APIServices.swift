//
//  APIServices.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 18/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation


class APIServices {
    
    func fetchFromLocalFile(from fileName:String) -> [Account]{
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {return []}
        guard let data = try? Data(contentsOf: url) else {return []}
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let json = try? decoder.decode(AccountList.self, from: data){
            if let accounts = json.accounts{
                return accounts
            }
        }
        return []
    }
    
    func fetchFromLocalFileGeneric<T: Decodable>(type: T.Type, from fileName:String) -> T?{
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let object = try? decoder.decode(T.self, from: data) {
                    return object
                }
            }
        }
        return nil
    }
    
    func fetchFromRESTAPIGeneric<T: Decodable>(type: T.Type, from address:String, completion:@escaping(T?)->Void) {
        if let url = URL(string: address) {
            URLSession.shared.dataTask(with: url) { data, respons, error in
                if let dataToDecode = data {
                    print("DATA >> \(dataToDecode)")
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    if let json = try? decoder.decode(T.self, from: dataToDecode) {
                        DispatchQueue.main.async {
                            completion(json)
                        }
                    }
                }
            }.resume()
        }
    }
    
    func fetchFromRESTAPI(from address:String, completion:@escaping([Account])->Void) {
        guard let url = URL(string: address) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            guard let dataToUse = data else {return}
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let json = try? decoder.decode([Account].self, from: dataToUse) {
                DispatchQueue.main.async {
                    completion(json)
                }
            }
        }.resume()
    }
    
    func fetchFromRESTAPIT(from address:String, completion:@escaping([Transaction])->Void) {
        guard let url = URL(string: address) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            guard let dataToUse = data else {return}
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let json = try? decoder.decode([Transaction].self, from: dataToUse){
                DispatchQueue.main.async {
                    completion(json)
                }
            }
        }.resume()
    }
}
