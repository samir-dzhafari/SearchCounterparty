//
//  CounterpartyListViewController.swift
//  SearchCounterparty
//
//  Created by Самир Джафари on 16.11.2023.
//

import UIKit

class CounterpartyListViewController: UITableViewController {

    var counterparties: [Counterparty]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentificators.routeToCounterpartyView.rawValue {
            guard let counterpartyVC = segue.destination as? CounterpartyViewController else {
                return
            }
            counterpartyVC.counterparty = sender as? Counterparty
        }
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        counterparties.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCounterparty", for: indexPath)

        let counterparty = counterparties[indexPath.row]
        
        var configuration = cell.defaultContentConfiguration()
        
        configuration.text = counterparty.name
        configuration.secondaryText = counterparty.data.ownership.getTitle()
        
        cell.contentConfiguration = configuration

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let counterparty = counterparties[indexPath.row]
        performSegue(
            withIdentifier: SegueIdentificators.routeToCounterpartyView.rawValue,
            sender: counterparty
        )
    }

}
