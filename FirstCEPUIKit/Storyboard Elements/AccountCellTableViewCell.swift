//
//  AccountCellTableViewCell.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 18/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class AccountCellTableViewCell: UITableViewCell {
    @IBOutlet weak var accountNameAndKind: UILabel!
    @IBOutlet weak var accountNumber: UILabel!
    @IBOutlet weak var accountCurrencyAndBalance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
