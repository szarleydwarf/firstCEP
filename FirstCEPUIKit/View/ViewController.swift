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
//        print("ACVC >> \(accounts)")
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
            let displayModel = viewModel.getDisplayModel(model: unwrappedAccounts[indexPath.row])
            
            cell.accountNameAndKind.text = displayModel.title
            cell.accountNumber.text = displayModel.firstSubtitle
            cell.accountCurrencyAndBalance.text = displayModel.secondSubtitle
            
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

