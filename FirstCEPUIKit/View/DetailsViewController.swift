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
    var transactions:[Transaction]?
    private let identifier:String = "AccountCellTableViewCell"
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchingFromRESTAPI()
//        localFetching()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transactionsTable.delegate = self
        self.transactionsTable.dataSource = self
        
        registerCell()
        
        setAccountImage()
        setViews()
    }
        
    func setAccountImage() {
        var imageName:String = "banknote"
        switch self.account?.kind {
        case Account.AccountKind.current.rawValue:
            imageName = "banknote"
        case Account.AccountKind.savings.rawValue:
            imageName = "goforward.plus"
        case Account.AccountKind.loan.rawValue:
            imageName = "gobackward.minus"
        case Account.AccountKind.term.rawValue:
            imageName = "snow"
        default:
            imageName = "banknote"
        }
        let image = UIImage(named: imageName)
        self.image.image = image
    }
    
    func setViews() {
        guard let accountUnwrapped = self.account else {return}
        self.kind.text = accountUnwrapped.kind
        self.accountTitle.text = accountUnwrapped.title
        self.number.text = accountUnwrapped.number
        self.currency.text = accountUnwrapped.currency
        self.balance.text = "\(accountUnwrapped.balance ?? 0.0)"
        self.openingData.text = accountUnwrapped.openingDate
    }
    
    func registerCell() {
        let customCell = UINib(nibName: identifier, bundle: nil)
        self.transactionsTable.register(customCell, forCellReuseIdentifier: identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let transactionsUnwrapped = transactions else {return UITableViewCell()}
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier) as? AccountCellTableViewCell {
            
            cell.accountNameAndKind.text = transactionsUnwrapped[indexPath.row].getReciepient()
            cell.accountNumber.text = transactionsUnwrapped[indexPath.row].getDate()
            cell.accountCurrencyAndBalance.text = transactionsUnwrapped[indexPath.row].getAmountCurrencyType()
            
            if transactionsUnwrapped[indexPath.row].type == "DB" {
                cell.accountCurrencyAndBalance.textColor = .red
            } else {
                cell.accountCurrencyAndBalance.textColor = .green
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func fetchingFromRESTAPI() {
        let placeholder = "https://my-json-server.typicode.com/szarleydwarf/firstCEP/master/db/transactions"
        APIServices().fetchFromRESTAPIT(from: placeholder) { transactionArray in
            self.transactions = transactionArray.filter{$0.from == self.account?.number}
            self.transactionsTable.reloadData()
        }
    }
    
    func localFetching() {
        if let transactionFetched = APIServices().fetchFromLocalFileGeneric(type: TransactionList.self, from: "Accounts") {
            if let transactionsUnwrapped = transactionFetched.transactions {
                transactions = transactionsUnwrapped.filter{$0.from == self.account?.number}
                self.transactionsTable.reloadData()
            }
        }
        
    }
}
