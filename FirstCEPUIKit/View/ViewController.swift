//
//  ViewController.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 18/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var table: UITableView!
    private var accounts:[Account]?
    private let identifier:String = "AccountCellTableViewCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        APIServices().fetchFromRESTAPI(from: "https://accounts-json-file.netlify.app/db.json") { accountsArray in
            print("Completed \(accountsArray)")
            self.accounts = accountsArray
            self.table.reloadData()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        accounts = APIServices().fetchFromLocalFile(from: "Accounts")
        
        self.table.dataSource = self
        self.table.delegate = self
        
        registerCell()
    }
    
    func registerCell() {
        let customCell = UINib(nibName: identifier, bundle: nil)
        self.table.register(customCell, forCellReuseIdentifier: identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = accounts?.count else {return 0}
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let unwrappedAccount = accounts else {return UITableViewCell()}
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? AccountCellTableViewCell {
            
            cell.accountNameAndKind.text = unwrappedAccount[indexPath.row].getName()
            cell.accountNumber.text = unwrappedAccount[indexPath.row].getNumber()
            cell.accountCurrencyAndBalance.text = unwrappedAccount[indexPath.row].getBalance()
            
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    
}

