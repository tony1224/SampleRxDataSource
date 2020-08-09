//
//  TableSectionModel.swift
//  SampleRxDataSorce
//
//  Created by Jun Morita on 2020/08/09.
//  Copyright © 2020 Jun Morita. All rights reserved.
//

import RxDataSources

typealias TableSectionModel = AnimatableSectionModel<SectionID, FirstTableBindingData>

enum SectionID: String, IdentifiableType {
    case Hoge
    case Fuga

    var identity: String {
        return self.rawValue
    }
}
