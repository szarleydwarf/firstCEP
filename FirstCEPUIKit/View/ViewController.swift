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
//        let placeholder = "https://my-json-server.typicode.com/szarleydwarf/firstCEP/master/db/accounts"
//        APIServices().fetchFromRESTAPI(from: placeholder) { accountsArray in
//            self.accounts = accountsArray
//            print("ACC \(accountsArray) \n")
//            self.table.reloadData()
//        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        accounts = APIServices().fetchFromLocalFile(from: "Accounts")
        if let acc = APIServices().fetchFromLocalFileGeneric(type: Accounts.self, from: "Accounts") {
            accounts = acc.accounts
//            print("ACCOUNTS>>\(accounts)")
        }

        
        if let transactionsList = APIServices().fetchFromLocalFileGeneric(type: Transactions.self ,from: "Accounts") {
            print("transactions \(transactionsList)")
        }
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
            
            var textToDisplay = unwrappedAccount[indexPath.row].getName()
            if let date = unwrappedAccount[indexPath.row].openingDate {
                textToDisplay = textToDisplay + " - " + date
            }
            cell.accountNameAndKind.text = textToDisplay
            cell.accountNumber.text = unwrappedAccount[indexPath.row].getNumber()
            cell.accountCurrencyAndBalance.text = unwrappedAccount[indexPath.row].getBalance()
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsView = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        if let accountsUnwraped = accounts {
            let account = accountsUnwraped[indexPath.row]
            detailsView.account = account
        }
        
        self.navigationController?.pushViewController(detailsView, animated: true)
    }
}

