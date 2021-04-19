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
    var observer:AnyCancellable?
    
    init(services: NetworKingProtocol = NetworKing(), localService:LocalDataProtocol = NetworKing()) {
        self.service = services
        self.localService = localService
    }
    
    var accounts:[Account]?
    
    // this returns 1 always, need to find out why
    var accountsCount:Int {
        return accounts?.count ?? 1
    }
    
    func getData (from: URL) -> [Account] {
        guard let acc = self.accounts else {return []}
        return acc
    }
    
    func getData (from fileNamed:String) -> [Account] {
        self.accounts = self.localService.fetchDataFromLocalFile(from: fileNamed)
        guard let acc = self.accounts else {return []}
        return acc
    }
}
