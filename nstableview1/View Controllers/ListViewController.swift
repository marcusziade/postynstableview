//
//  ListViewController.swift
//  nstableview1
//
//  Created by Marcus Ziadé on 12.3.2021.
//

import AppKit

class ListViewController: NSViewController {

    // MARK: - Stores
    let tracksStore: TracksStore = TracksStore()

    // MARK: - Properties
    var tracks: [Track] = []

    // MARK: - UI Components
    let scrollView = NSScrollView()

    lazy var tableView: NSTableView = {
        let tableView = NSTableView()
        tableView.intercellSpacing = NSSize(width: 8, height: 12)
        tableView.headerView = nil

        let column = NSTableColumn()
        tableView.addTableColumn(column)

        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Lifecycle methods
    override func loadView() {
        view = scrollView
        scrollView.documentView = tableView
        view.setFrameSize(NSSize(width: 400, height: 500))

        tracksStore.getTracks { [weak self] tracks in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tracks = tracks
                self.tableView.reloadData()
            }
        }
    }

}

// MARK: - Tableview Datasource
extension ListViewController: NSTableViewDataSource {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return tracks.count
    }

}

// MARK: - Tableview Delegate
extension ListViewController: NSTableViewDelegate {

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = NSTableCellView()
        let textField = NSTextField(labelWithString: "\(row + 1). \(tracks[row].track)")
        cell.addSubview(textField)
        return cell
    }

}
