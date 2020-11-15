//
//  APIServiceVM.swift
//  FirstCEP
//
//  Created by The App Experts on 15/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

class APIServiceVM {
    func fetchDataFromLocalFile(from url:URL) -> Accounts? {
        guard let data = try? Data(contentsOf: url) else { fatalError("Couldnot read the file") }
        guard let accounts = try? JSONDecoder().decode(Accounts.self, from: data) else{fatalError("Could not decode data") }
        
        return accounts
    }
}
