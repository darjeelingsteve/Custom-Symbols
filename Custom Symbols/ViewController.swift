//
//  ViewController.swift
//  Custom Symbols
//
//  Created by Stephen Anthony on 22/10/2019.
//  Copyright © 2019 Darjeeling Apps. All rights reserved.
//

import UIKit

/// The table view controller used to show examples of system symbols alongside
/// custom symbols.
class ViewController: UITableViewController {
    private let tableSections = [TableSection(kind: .system, symbolNames: ["checkmark.square", "pencil.circle", "trash"]),
                                 TableSection(kind: .custom, symbolNames: ["pentagon"])]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableSections[section].numberOfSymbols
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let tableSection = tableSections[indexPath.section]
        cell.textLabel?.text = tableSection.symbolNames[indexPath.row]
        cell.imageView?.image = tableSection.symbol(at: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableSections[section].name
    }
}
