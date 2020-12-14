//
//  DetailsViewController.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 19/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var kind: UILabel!
    @IBOutlet weak var accountTitle: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var openingData: UILabel!
    @IBOutlet weak var transactionsTable: UITableView!
    
    var account:Account?
    private let identifier:String = "AccountCellTableViewCell"
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

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
        if let accountKind = self.account?.kind {
            let image = UIImage(named: viewModel.getImageName(kind: accountKind))
            self.image.image = image
        }
    }
    
    func setViews() {
        guard let accountUnwrapped = self.account else {return}
        self.kind.text = accountUnwrapped.kind
        self.accountTitle.text = accountUnwrapped.title
        self.number.text = accountUnwrapped.number
        self.currency.text = viewModel.getCurrencySymbol(from: accountUnwrapped.currency)
        self.balance.text = viewModel.formatAmount(amount: accountUnwrapped.balance)
        self.openingData.text = accountUnwrapped.openingDate
    }
    
    func registerCell() {
        let customCell = UINib(nibName: identifier, bundle: nil)
        self.transactionsTable.register(customCell, forCellReuseIdentifier: identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.account?.transactions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let transactionsUnwrapped = self.account?.transactions else {return UITableViewCell()}
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier) as? AccountCellTableViewCell {
            let model = transactionsUnwrapped[indexPath.row] as Transaction

            update(cell, with: model)
            return cell
        }
        return UITableViewCell()
    }
    
    func update(_ cell: AccountCellTableViewCell, with transaction: Transaction) {
        cell.accountNameAndKind.text = viewModel.getTextToDisplay(from: transaction.recipient)
        cell.accountNumber.text = viewModel.getTextToDisplay(from: transaction.dataOfTransaction)
        cell.accountCurrencyAndBalance.text = viewModel.getTextToDisplay(from: transaction.type, secondString: viewModel.getCurrencySymbol(from: transaction.currency), thirdString: viewModel.formatAmount(amount: transaction.amount))
        
        cell.accountCurrencyAndBalance.textColor = viewModel.getTextColor(type: transaction.type)
    }
}
