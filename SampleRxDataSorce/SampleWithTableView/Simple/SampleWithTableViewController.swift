//
//  SampleWithTableViewController.swift
//  SampleRxDataSorce
//
//  Created by Jun Morita on 2020/08/09.
//  Copyright © 2020 Jun Morita. All rights reserved.
//

import UIKit
import RxDataSources

class SampleWithTableViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
        }
    }
    
    private let sections = [
        TableSectionModel(
            model: SectionID.Hoge,
            items: [
                FirstTableBindingData(
                    id: UUID().uuidString,
                    name: "データ1",
                    description: "親譲おやゆずりの無鉄砲むてっぽうで小供の時から損ばかりしている"
                ),
                FirstTableBindingData(
                    id: UUID().uuidString,
                    name: "データ2",
                    description: "小学校に居る時分学校の二階から飛び降りて一週間ほど腰こしを抜ぬかした事がある"
                )
            ]
        ),
        TableSectionModel(
            model: SectionID.Fuga,
            items: [
                FirstTableBindingData(
                    id: UUID().uuidString,
                    name: "データ3",
                    description: "なぜそんな無闇むやみをしたと聞く人があるかも知れぬう"
                ),
                FirstTableBindingData(
                    id: UUID().uuidString,
                    name: "データ4",
                    description: "別段深い理由でもない"
                )
            ]
        ),
    ]
    
    private lazy var dataSource = RxTableViewSectionedAnimatedDataSource<TableSectionModel>.init(
        animationConfiguration: AnimationConfiguration(),
        configureCell: { [weak self] dataSource, table, indexPath, item in
            return table.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
        }
    )

    // MARK: - Lifecycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "TableView(Simple)"
        tableView.dataSource = self
    }

}

extension SampleWithTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = model.description
        return cell
    }
    
}
