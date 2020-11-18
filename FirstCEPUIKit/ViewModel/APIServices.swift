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
        print("ACC \(accounts)")
        return accounts
    }
}
