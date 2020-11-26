//
//  DetailsViewController.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 19/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var kind: UILabel!
    @IBOutlet weak var accountTitle: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var openingData: UILabel!
    @IBOutlet weak var transactionsTable: UITableView!
    
    var account:Account?
    var transactions:Transactions?
    private let identifier:String = "AccountCellTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ACCOUNT >> \(account)")
        
        self.transactionsTable.delegate = self
        self.transactionsTable.dataSource = self
        
        
        registerCell()
        
        fetchTransactionsForAccount()
        setViews()
    }
    
    func fetchTransactionsForAccount() {
        
    }
    
    func setViews() {
        
    }
    
    func registerCell() {
        let customCell = UINib(nibName: identifier, bundle: nil)
        self.transactionsTable.register(customCell, forCellReuseIdentifier: identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions?.transactions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let transactionsUnwrapped = transactions?.transactions else {return UITableViewCell()}
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier) as? AccountCellTableViewCell {
            
//            cell.accountNameAndKind.text = transactionsUnwrapped
//            cell.accountNumber.text = transactionsUnwrapped
//            cell.accountCurrencyAndBalance.text = transactionsUnwrapped
            
            return cell
        }
        return UITableViewCell()
    }

}
