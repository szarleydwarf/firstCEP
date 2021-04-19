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
    
    init(services: NetworKingProtocol = NetworKing()) {
        self.service = services
    }
    
    var accounts:[Account]?
    
    var accountsCount:Int {
        return accounts?.count ?? 1
    }
    
    func getData (from: URL) {
        
    }
}
