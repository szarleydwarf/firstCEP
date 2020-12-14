//
//  ViewController.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 18/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet weak var table: UITableView!
    private var accounts:[Account]?
    private let identifier:String = "AccountCellTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.dataSource = self
        self.table.delegate = self
        
        registerCell()
        accounts = viewModel.getAccounts()?.accounts
    }
    
    func registerCell() {
        let customCell = UINib(nibName: identifier, bundle: nil)
        self.table.register(customCell, forCellReuseIdentifier: identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let unwrappedAccounts = accounts else {return UITableViewCell()}
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? AccountCellTableViewCell {
            let model =  unwrappedAccounts[indexPath.row] as Account
            update(cell, with: model)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func update(_ cell: AccountCellTableViewCell, with account: Account) {
        cell.accountNameAndKind.text = viewModel.getTextToDisplay(from: account.title, secondString: account.kind)
        cell.accountNumber.text = viewModel.getTextToDisplay(from: account.number)
        cell.accountCurrencyAndBalance.text = viewModel.getTextToDisplay(from: viewModel.getCurrencySymbol(from: account.currency), secondString: viewModel.formatAmount(amount: account.balance))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let accountsUnwraped = accounts {
            let account = accountsUnwraped[indexPath.row]
            if let navController = self.navigationController {
                viewModel.displayDetailsView(navigation: navController, account)
            }
        }
    }
}

