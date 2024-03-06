//
//  ContentTableViewCell.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import UIKit

struct ContentTableViewCellModel {
    let imageProfile: String
    let name: String
    let likeByName: String
    let likeByImage: String
    let commentImage: String
}

class ContentTableViewCell: UITableViewCell {
    @IBOutlet private weak var borderProfileView: UIView!
    @IBOutlet private weak var imageProfileView: UIImageView!
    @IBOutlet private weak var nameLabeel: UILabel!
    @IBOutlet private weak var likeByLabel: UILabel!
    @IBOutlet private weak var likeImageProfileView: UIImageView!
    @IBOutlet private weak var commentImageProfileView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        borderProfileView.makeCircular()
        borderProfileView.backgroundColor = .white
        borderProfileView.layer.borderWidth = 1
        borderProfileView.layer.borderColor = UIColor.red.cgColor
        imageProfileView.makeCircular()
        likeImageProfileView.makeCircular()
        commentImageProfileView.makeCircular()
    }
    
    func setCell(data: ContentTableViewCellModel) {
        imageProfileView.image = UIImage(named: data.imageProfile)
        nameLabeel.text = data.name
        likeByLabel.text = data.likeByName
        likeImageProfileView.image = UIImage(named: data.likeByImage)
        commentImageProfileView.image = UIImage(named: data.commentImage)
    }
}
