//
//  ViewController.swift
//  SampleRxDataSorce
//
//  Created by Jun Morita on 2020/08/09.
//  Copyright © 2020 Jun Morita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    private var items = ["TableView(Simple)", "TableView", "CollectionView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SampleRxDataSource"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "SampleWithTableViewController", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SampleWithTableViewController") as! SampleWithTableViewController
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            // TODO: TableView(複数Sectionに複数Item)作成時に対応
        } else if indexPath.row == 2 {
            // TODO: CollectionView画面作成時に対応
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
