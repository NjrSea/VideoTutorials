//
//  ViewController.swift
//  XPTableView
//
//  Created by wang ya on 2020/6/22.
//  Copyright © 2020 EYA-Studio. All rights reserved.
//

import UIKit

class CustomCell: XPTableViewCell {
    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

class ViewController: UIViewController, XPTableViewDelegate, XPTableViewDataSource {

    private var tableView: XPTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = XPTableView()
        tableView.xpDelegate = self
        tableView.xpDataSource = self
        tableView.frame = view.bounds
        tableView.registerCell(cellClass: CustomCell.self, forReuseIdentifier: "cell")
        view.addSubview(tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

// MARK: XPTableViewDelegate, XPTableViewDataSource

    func xpTableView(heightForRow row: UInt) -> CGFloat {
        return CGFloat(20 * row)
    }

    func numberOfRows(in xpTableView:XPTableView) -> Int {
        return 30
    }

    func xpTableView(tableView: XPTableView, cellForRowAtIndex: Int) -> XPTableViewCell {
        let cell = tableView.dequeueReusableCell(reuseIdentifier: "cell")
        cell?.backgroundColor = UIColor.random
        return cell!
    }

}

