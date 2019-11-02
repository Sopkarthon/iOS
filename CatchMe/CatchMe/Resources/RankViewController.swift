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
    @IBOutlet weak var userImageView: UIImageView!
    
    let sampleImgSet = ["sample1", "sample2", "sample3", "sample4",]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.userImageView.layer.cornerRadius = self.userImageView.frame.width/2
        
        self.setNeedsStatusBarAppearanceUpdate()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension RankViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rankCell", for: indexPath) as? RankCollectionViewCell else { return UICollectionViewCell() }
        
        let imageString = sampleImgSet[indexPath.item % 4]
        cell.imageView.image = UIImage(named: imageString)
        cell.nickNameLabel.text = "test"
        cell.memoLabel.text = "test"
        cell.likeNumLabel.text = "111"
        
        return cell
    }
    
    
    
    
}
