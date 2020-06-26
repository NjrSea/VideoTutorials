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
            if self.didFinishInitialLayout {
                self.layoutTableRows()
            }
        }
    }

    public func registerCell(cellClass: AnyClass, forReuseIdentifier: String) {
        classMap[forReuseIdentifier] = cellClass
    }

    public func dequeueReusableCell(reuseIdentifier identifier: String) -> XPTableViewCell? {
        let index = reusePool.firstIndex {
            return $0.reuseIdentifier == identifier
        }
        guard let i = index else {
            if let cellClass = classMap[identifier] as? XPTableViewCell.Type {
                return initializeCell(fromType: cellClass, reuseIdentifier: identifier)
            }
            return nil
        }
        return reusePool.remove(at: i)
    }

    public func reloadData() {
        returnNonVisibleRowsToThePool(rows: nil)
        generateHeightAndOffsetData()
        layoutTableRows()
    }

    private func generateHeightAndOffsetData() {
        guard let checkHeightForEachRow = xpDelegate?.responds(to: #selector(XPTableViewDelegate.xpTableView(heightForRow:))) else {
            return
        }
        var currentOffsetY: CGFloat = 0
        var newRowRecords = Array<RowRecord>()

        guard let numberOfRows = xpDataSource?.numberOfRows(in: self) else {
            return
        }
        for row in 0...numberOfRows-1 {
            let rowHeight = checkHeightForEachRow ? xpDelegate!.xpTableView(heightForRow: UInt(row)) : self.rowHeight

            var rowRecord = RowRecord()

            rowRecord.height = rowHeight
            rowRecord.startOffset = currentOffsetY

            newRowRecords.append(rowRecord)
            currentOffsetY += rowHeight
        }

        rowRecords = newRowRecords
        contentSize = CGSize(width: bounds.width, height: CGFloat(currentOffsetY))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTableRows()
        self.didFinishInitialLayout = true
    }

    private func layoutTableRows() {
        let currentStartY = contentOffset.y
        let currentEndY = currentStartY + frame.height

        var rowToDisplay = findRow(for: currentStartY, inRange: NSRange(location: 0, length: rowRecords.count))

        let newVisibleRows = NSMutableIndexSet()

        var yOrigin: CGFloat = 0
        var rowHeight: CGFloat = 0

        repeat {
            newVisibleRows.add(rowToDisplay)
            yOrigin = startPositionY(for: rowToDisplay)

            var cell: XPTableViewCell? = cachedCell(for: rowToDisplay)

            if cell == nil {
                cell = xpDataSource?.xpTableView(tableView: self, cellForRowAtIndex: rowToDisplay)
                cache(cell, for: rowToDisplay)
                rowHeight = height(for: rowToDisplay)
                cell?.frame = CGRect(x: 0, y: yOrigin, width: bounds.width, height: rowHeight)
                if let cell = cell {
                    addSubview(cell)
                }
            }
            rowToDisplay += 1
        } while yOrigin + rowHeight < currentEndY && rowToDisplay < rowRecords.count

        returnNonVisibleRowsToThePool(rows: newVisibleRows)
    }

    private func height(for row: Int) -> CGFloat {
        guard row < rowRecords.count else {
            return 0
        }
        return rowRecords[row].height
    }

    private func findRow(for offsetY: CGFloat, inRange: NSRange) -> Int {
        guard rowRecords.count > 0 else {
            return 0
        }
        var record = RowRecord()
        record.startOffset = offsetY

        let index = (rowRecords as NSArray).index(of: record, inSortedRange: NSRange(location: 0, length: rowRecords.count), options: NSBinarySearchingOptions.insertionIndex) { (l: Any, r: Any) -> ComparisonResult in
            if (l as! RowRecord).startOffset < (r as! RowRecord).startOffset {
                return ComparisonResult.orderedAscending
            }
            return ComparisonResult.orderedDescending
        }
        if index == 0 {
            return 0
        }
        return index - 1
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
        if let rows = rows {
            visibleRows?.remove(rows as IndexSet)
        }
        visibleRows?.enumerate { (row: Int, stop: UnsafeMutablePointer<ObjCBool>) in
            let cell = cachedCell(for: row)
            if let cell = cell {
                reusePool.append(cell)
                cell.removeFromSuperview()
                cache(nil, for: row)
            }
        }
        visibleRows = rows
    }
}
