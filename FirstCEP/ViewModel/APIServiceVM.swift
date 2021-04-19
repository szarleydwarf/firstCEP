//
//  APIServiceVM.swift
//  FirstCEP
//
//  Created by The App Experts on 15/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Combine
import Foundation

class ViewModel {
    var service: NetworKingProtocol!
    var localService:LocalDataProtocol!
    
    init(services: NetworKingProtocol = NetworKing(), localService:LocalDataProtocol = NetworKing()) {
        self.service = services
        self.localService = localService
    }
    
    var accounts:[Account]? {
        didSet {
            
        }
    }
    
    var accountsCount:Int {
        return accounts?.count ?? 1
    }
    
    func getData (from: URL) {
        
    }
    
    func getData (from fileNamed:String) {
        self.accounts = self.localService.fetchDataFromLocalFile(from: fileNamed)
    }
}
