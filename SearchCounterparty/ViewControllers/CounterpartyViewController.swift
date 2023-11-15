//
//  CounterpartyViewController.swift
//  SearchCounterparty
//
//  Created by Самир Джафари on 16.11.2023.
//

import UIKit

class CounterpartyViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    var counterparty: Counterparty!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = counterparty.name
        descriptionLabel.text = counterparty.data.description
    }

}
