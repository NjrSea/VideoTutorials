//
//  XPTableView.swift
//  XPTableView
//
//  Created by wang ya on 2020/6/22.
//  Copyright © 2020 EYA-Studio. All rights reserved.
//

import UIKit

protocol CellInitializable {
    init(reuseIdentifier: String)
}

func initializeCell<T: CellInitializable>(fromType type: T.Type, reuseIdentifier: String) -> T {
    return T.init(reuseIdentifier: reuseIdentifier)
}

class XPTableViewCell: UIView, CellInitializable {

    var reuseIdentifier: String = "XPTableViewCell"

    required init(reuseIdentifier: String) {
        super.init(frame: CGRect.zero)
        self.reuseIdentifier = reuseIdentifier
    }

    required init?(coder: NSCoder) {
        super.init(frame: CGRect.zero)
    }

}

@objc protocol XPTableViewDelegate: UIScrollViewDelegate {
    func xpTableView(heightForRow row: UInt) -> CGFloat
}

protocol XPTableViewDataSource: class {
    func numberOfRows(in xpTableView:XPTableView) -> Int
    func xpTableView(tableView: XPTableView, cellForRowAtIndex: Int) -> XPTableViewCell
}

class XPTableView: UIScrollView {

    struct RowRecord {
        var startOffset: CGFloat = 0
        var height: CGFloat = 0
        var cachedCell: XPTableViewCell?
    }

    private var reusePool = Array<XPTableViewCell>()
    private var rowRecords = Array<RowRecord>()
    private var didFinishInitialLayout = false

    private var classMap = Dictionary<String, AnyClass>()

    public weak var xpDataSource: XPTableViewDataSource?
    public weak var xpDelegate: XPTableViewDelegate?

    public var rowHeight: CGFloat = 40

    public var visibleRows: NSMutableIndexSet?

    override var contentOffset: CGPoint {
        didSet {

        }
    }

    public func registerCell(cellClass: AnyClass, forReuseIdentifier: String) {

    }

    public func dequeueReusableCell(reuseIdentifier identifier: String) -> XPTableViewCell? {
        return nil
    }

    public func reloadData() {

    }

    private func generateHeightAndOffsetData() {

    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }

    private func layoutTableRows() {

    }

    private func height(for row: Int) -> CGFloat {
        guard row < rowRecords.count else {
            return 0
        }
        return rowRecords[row].height
    }

    private func findRow(for offsetY: CGFloat, inRange: NSRange) -> Int {
        return 0
    }

    private func startPositionY(for row: Int) -> CGFloat {
        guard row < rowRecords.count else {
            return 0
        }
        return rowRecords[row].startOffset
    }

    private func cachedCell(for row: Int) -> XPTableViewCell? {
        guard row < rowRecords.count else {
            return nil
        }
        return rowRecords[row].cachedCell
    }

    private func cache(_ cell: XPTableViewCell?, for row: Int) {
        guard row < rowRecords.count else {
            return
        }
        rowRecords[row].cachedCell = cell
    }

    private func returnNonVisibleRowsToThePool(rows: NSMutableIndexSet?) {
        
    }
}
