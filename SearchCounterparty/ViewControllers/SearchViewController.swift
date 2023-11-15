//
//  ViewController.swift
//  SearchCounterparty
//
//  Created by Самир Джафари on 15.11.2023.
//

import UIKit

final class SearchViewController: UIViewController {

    @IBOutlet weak var searchTF: UITextField!
    
    private let dadataGateway = DadataGateway.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == SegueIdentificators.routeToCounterpartyListView.rawValue else {
            return
        }
        
        guard let counterpartyListVC = segue.destination as? CounterpartyListViewController else {
            return
        }
        
        guard let counterparties = sender as? [Counterparty] else {
            return
        }
        
        counterpartyListVC.counterparties = counterparties
    }
    
    @IBAction func searchButtonTapped() {
        guard let value = searchTF.text else {
            return
        }
        
        dadataGateway.getCounterparties(value) { [unowned self] result in
            switch result {
            case .success(let counterparties):
                DispatchQueue.main.sync {
                    self.showCounterpartyListVC(counterparties: counterparties)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func showCounterpartyListVC(counterparties: [Counterparty]) {
        self.performSegue(
            withIdentifier: SegueIdentificators.routeToCounterpartyListView.rawValue,
            sender: counterparties
        )
    }
    
}

