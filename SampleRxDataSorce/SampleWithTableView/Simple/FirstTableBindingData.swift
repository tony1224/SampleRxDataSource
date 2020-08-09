//
//  FirstTableBindingData.swift
//  SampleRxDataSorce
//
//  Created by Jun Morita on 2020/08/09.
//  Copyright © 2020 Jun Morita. All rights reserved.
//

import Foundation
import RxDataSources

struct FirstTableBindingData: IdentifiableType, Equatable {
    // NOTE: ここはRxとのお約束
    typealias Identity = String
    var identity: String {
        return id
    }
    
    let id: String
    let name: String
    let description: String
}
