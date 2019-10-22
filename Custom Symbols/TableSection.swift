//
//  TableSection.swift
//  Custom Symbols
//
//  Created by Stephen Anthony on 22/10/2019.
//  Copyright © 2019 Darjeeling Apps. All rights reserved.
//

import UIKit

/// Represents a section in the Symbols example table view.
struct TableSection {
    
    /// The different kinds of symbol that can be displayed.
    ///
    /// * system - Represents symbols that are included in the OS.
    /// * custom - Reoresents symbols that we have created ourselves an included
    /// in our application's resources.
    enum SymbolKind {
        case system
        case custom
    }
    
    let kind: SymbolKind
    let symbolNames: [String]
    
    /// The receiver's name.
    var name: String {
        return kind.name
    }
    
    /// The number of symbols that the receiver represents.
    var numberOfSymbols: Int {
        return symbolNames.count
    }
    
    /// - Parameter index: The index of the symbol we wish to retrieve.
    /// - Returns The symbol at the given index.
    func symbol(at index: Int) -> UIImage? {
        return kind.symbol(forName: symbolNames[index])
    }
}

private extension TableSection.SymbolKind {
    var name: String {
        switch self {
        case .system:
            return "System"
        case .custom:
            return "Custom"
        }
    }
    
    func symbol(forName name: String) -> UIImage? {
        let symbolConfiguration = UIImage.SymbolConfiguration(font: UIFont.preferredFont(forTextStyle: .body), scale: .medium)
        switch self {
        case .system:
            return UIImage(systemName: name)?.withConfiguration(symbolConfiguration)
        case .custom:
            return UIImage(named: name)?.withConfiguration(symbolConfiguration)
        }
    }
}
