//
//  RankViewController.swift
//  CatchMe
//
//  Created by 남수김 on 2019/11/03.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit

class RankViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        
    }
    
}

extension RankViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rankCell", for: indexPath) as? RankCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageView.image = UIImage(named: "")
        cell.nickNameLabel.text = "test"
        cell.memoLabel.text = "test"
        cell.likeNumLabel.text = "111"
        cell.likeImageView.image = UIImage(named: "")
        
        return cell
    }
    
    
    
    
}
