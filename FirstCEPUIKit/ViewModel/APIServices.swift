//
//  APIServices.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 18/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation


class APIServices {
    func fetchFromLocalFile(from fileName:String) -> [Account] {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {return []}
        guard let data = try? Data(contentsOf: url) else {return []}
        print("DATA>> \(data)")
        guard let json = try? JSONDecoder().decode([Account].self, from: data) else {return []}
        print("JAJSON >> \(json)")
        let accounts :[Account] = [] 
        
        return accounts
    }
    
    func fetchFromLocalFileGeneric<T: Decodable>(type:T.Type, from fileName:String) -> [T]{
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {fatalError("could not create URL")}
        guard let data = try? Data(contentsOf: url) else {fatalError("could not create data")}
        guard let object = try? JSONDecoder().decode([T].self, from: data) else {return []}
        return object
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
