//
//  ListViewController.swift
//  nstableview1
//
//  Created by Marcus Ziadé on 12.3.2021.
//

import AppKit
import Foundation

final class ListViewController: NSViewController {

    override func loadView() {
        view = scrollView
        scrollView.documentView = tableView
        view.setFrameSize(NSSize(width: 400, height: 500))

        tracksStore.getTracks { [unowned self] tracks in
            DispatchQueue.main.async { [self] in
                self.tracks = tracks
                tableView.reloadData()
            }
        }
    }


    // MARK: - Private

    private let tracksStore = TracksStore()

    private var tracks: [Track] = []

    private let scrollView = NSScrollView()

    private lazy var tableView: NSTableView = {
        let tableView = NSTableView()
        tableView.intercellSpacing = NSSize(width: 8, height: 12)
        tableView.headerView = nil

        let column = NSTableColumn()
        tableView.addTableColumn(column)

        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
}

// MARK: - NSTableViewDataSource

extension ListViewController: NSTableViewDataSource {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return tracks.count
    }
}

// MARK: - NSTableViewDelegate

extension ListViewController: NSTableViewDelegate {

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = NSTableCellView()
        let textField = NSTextField(labelWithString: "\(row + 1). \(tracks[row].track)")
        cell.addSubview(textField)
        return cell
    }
}
