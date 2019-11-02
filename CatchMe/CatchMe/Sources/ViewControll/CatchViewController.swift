//
//  CatchViewController.swift
//  CatchMe
//
//  Created by 남수김 on 2019/11/03.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit

class CatchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var sampleDataSet: [SampleData] = []
    @IBOutlet weak var titleNickLabel: UILabel!
    @IBOutlet weak var titleDistanceLabel: UILabel!
    @IBOutlet weak var titleMemoLabel: UILabel!
    @IBOutlet weak var titleImgView: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var ghostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorColor = .clear
        
        let sample1 = SampleData(nick: "어느흔한조커", memo: "놀리지마라", image: "sample1", distance: "1km")
        let sample2 = SampleData(nick: "백설설탕", memo: "개드립..", image: "sample2", distance: "3.5km")
        let sample3 = SampleData(nick: "햄버거드쉴?", memo: "입벌려", image: "sample3", distance: "0.5km")
        let sample4 = SampleData(nick: "아바타", memo: "으에에...", image: "sample4", distance: "4.5km")
        
        sampleDataSet.append(sample1)
        sampleDataSet.append(sample2)
        sampleDataSet.append(sample3)
        sampleDataSet.append(sample4)
        sampleDataSet.append(sample1)
        sampleDataSet.append(sample2)
        sampleDataSet.append(sample3)
        sampleDataSet.append(sample4)
        sampleDataSet.append(sample1)
        sampleDataSet.append(sample2)
        sampleDataSet.append(sample3)
        sampleDataSet.append(sample4)
        Set()
    }
    @IBAction func goProfileButtonClick(_ sender: Any) {
    }
    
    func Set(){
        self.titleImgView.alpha = 0
        self.titleMemoLabel.alpha = 0
        self.titleNickLabel.alpha = 0
        self.titleDistanceLabel.alpha = 0
        self.profileButton.alpha = 0

    }
    
}

struct SampleData{
    let nick: String
    let memo: String
    let image: String
    let distance: String
}

extension CatchViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sampleDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "catchCell", for: indexPath) as? CatchTableViewCell else {return UITableViewCell() }
        
        let data = sampleDataSet[indexPath.row]
        cell.imgView.image = UIImage(named: data.image)
        cell.memoLabel.text = data.memo
        cell.nickLabel.text = data.nick
        cell.distanceLabel.text = data.distance
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = self.tableView.cellForRow(at: indexPath) as? CatchTableViewCell else {return}
        
        self.titleImgView.image = cell.imgView.image
        self.titleDistanceLabel.text = cell.distanceLabel.text
        self.titleMemoLabel.text = cell.memoLabel.text
        self.titleNickLabel.text = cell.nickLabel.text
        
       
        UIView.animate(withDuration: 0.3, animations:{
            self.ghostLabel.transform = CGAffineTransform(translationX: 0, y: 400)
                   self.tableView.transform = CGAffineTransform(translationX: 0, y: 400)
            self.titleImgView.alpha = 1
            self.titleMemoLabel.alpha = 1
            self.titleNickLabel.alpha = 1
            self.titleDistanceLabel.alpha = 1
            self.profileButton.alpha = 1
            
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        UIView.animate(withDuration: 0.3, animations:{
            self.ghostLabel.transform =
                .identity
            self.tableView.transform = .identity
            self.titleImgView.alpha = 0
            self.titleMemoLabel.alpha = 0
            self.titleNickLabel.alpha = 0
            self.titleDistanceLabel.alpha = 0
            self.profileButton.alpha = 0
        })
        
    }
}
