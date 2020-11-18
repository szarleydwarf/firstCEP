//
//  ViewController.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 18/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let accounts = APIServices().fetchFromLocalFile(from: "Accounts")
    }


}

