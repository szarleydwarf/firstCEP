//
//  APIServiceVM.swift
//  FirstCEP
//
//  Created by The App Experts on 15/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

class APIServiceVM {
    func fetchData(from url:URL, completion:@escaping(Accounts)->Void) {
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else {return}
            print("Data \(data)")
            let accounts = try? JSONDecoder().decode(Accounts.self, from: data)
            
            
            DispatchQueue.main.async {
                completion(accounts!)
            }
        }.resume()
    }
}
