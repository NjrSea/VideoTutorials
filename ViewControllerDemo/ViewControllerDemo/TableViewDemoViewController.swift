//
//  TableViewDemoViewController.swift
//  ViewControllerDemo
//
//  Created by wang ya on 2021/8/3.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!

    @IBOutlet weak var label: UILabel!


    static let reuseIdentifierString = "MyTableViewCell"
}

class TableViewDemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    private var set = Set<UITableViewCell>()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        // 复用
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }

    // MARK: UITableViewDelegate, UITableViewDataSource

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40 * (indexPath.row + 1))
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.reuseIdentifierString, for: indexPath) as! MyTableViewCell
        cell.label.text = "\(indexPath)"
        set.insert(cell)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section)"
    }

}
