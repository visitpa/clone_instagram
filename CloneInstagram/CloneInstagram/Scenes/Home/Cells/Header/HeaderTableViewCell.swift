//
//  HeaderTableViewCell.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
    }
}
