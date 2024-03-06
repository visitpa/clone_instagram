//
//  HomeModels.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import Foundation

enum HomeModels {
    enum CellTypes {
        case header
        case stories([StoriesTableViewCellModel])
        case contents(ContentTableViewCellModel)
    }
    
    enum Datas {
        struct ViewModel {
            let datas: [HomeModels.CellTypes]
        }
    }
}
