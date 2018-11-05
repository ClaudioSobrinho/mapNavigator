//
//  UITableView+MapNavigator.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 29/10/2018.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let nib = UINib(nibName: String(describing: cellType), bundle: bundle)
        let identifier = String(describing: cellType)
        register(nib, forCellReuseIdentifier: identifier)
    }
    
    public func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as! T
    }
}
