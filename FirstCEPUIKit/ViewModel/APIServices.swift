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
        if let json = try? decoder.decode(Accounts.self, from: data){
            return json.accounts
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
    
    func fetchFromRESTAPI(from address:String, completion:@escaping([Account])->Void) {
        guard let url = URL(string: address) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            guard let dataToUse = data else {return}
//            print("DATA >> \n\(dataToUse)")
//            print("RESP >> \(respons)")
//            print("ERRO >> \(error)")
            let json = try? JSONDecoder().decode([Account].self, from: dataToUse)
//                        print("JSON >> \(json)")
            
            DispatchQueue.main.async {
                guard let accounts = json else {return}
                completion(accounts)
            }
        }.resume()
    }
}
