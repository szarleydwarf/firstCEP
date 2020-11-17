//
//  APIServiceVM.swift
//  FirstCEP
//
//  Created by The App Experts on 15/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

class APIServiceVM {
    func fetchDataFromLocalFile(from file:String) -> [Account] {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {fatalError("could not create the path")}
        
        guard let data = try? Data(contentsOf: url) else { fatalError("Couldnot read the file")}
        
        guard let accounts = try? JSONDecoder().decode([Account].self, from: data) else{fatalError("Could not decode data")}
        print("ac \(accounts)")
        
        return accounts
    }
}
