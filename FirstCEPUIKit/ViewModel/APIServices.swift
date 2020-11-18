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
        guard let accounts = try? JSONDecoder().decode([Account].self, from: data) else {return []}
        return accounts
    }
    
    func fetchFromRESTAPI(from url:String, completion:@escaping([Account])->Void) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            guard let data = data else {return}
            guard let respons = respons else {return}
            guard let error = error else {return}
            
            print("DATA \(data)")
            print("RESP \(respons)")
            print("ERRO \(error)")

            DispatchQueue.main.async {
                completion([])
            }
        }.resume()
    }
}
