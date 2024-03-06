//
//  StoryCollectionViewCell.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var borderView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        borderView.backgroundColor = .white
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.red.cgColor
        borderView.makeCircular()
        imageView.makeCircular()
    }
    
    func setCell(data: StoriesTableViewCellModel) {
        imageView.image = UIImage(named: data.image)
        nameLabel.text = data.name
    }
}
