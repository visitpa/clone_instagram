//
//  StoriesTableViewCell.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import UIKit

struct StoriesTableViewCellModel {
    let image: String
    let name: String
}

class StoriesTableViewCell: UITableViewCell {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var data: [StoriesTableViewCellModel]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
    }
    
    func setCell(data: [StoriesTableViewCellModel]) {
        self.data = data
        collectionView.reloadData()
    }
}

extension StoriesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell,
              let data = data?[indexPath.item] else {
            return UICollectionViewCell()
        }
        cell.setCell(data: data)
        return cell
    }
}

extension StoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 88, height: 124)
    }
}
