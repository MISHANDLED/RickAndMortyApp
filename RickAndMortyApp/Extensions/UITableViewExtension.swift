//
//  UITableViewExtension.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 15/01/23.
//

import UIKit

extension UITableView {
    func register(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    func registerHeaderFooter(_ type: UITableViewHeaderFooterView.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forHeaderFooterViewReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(_ type: T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
    
    func dequeueReusableHeaderFooterView<T>(_ type: T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableHeaderFooterView(withIdentifier: className) as? T
    }
    
    func addTableFooter() {
        if self.tableFooterView == nil {
            let footerView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
            self.tableFooterView = footerView
            footerView.startAnimating()
        }
    }

    func removeTableFooter() {
        self.tableFooterView = nil
    }
}
