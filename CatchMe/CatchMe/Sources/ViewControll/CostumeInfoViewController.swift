//
//  CostumeInfoViewController.swift
//  CatchMe
//
//  Created by 최은지 on 03/11/2019.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit

import NMapsMap

class CostumeInfoViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var costumeUserName: UILabel!
    @IBOutlet weak var costumeUserLocation: UILabel!
    @IBOutlet weak var costumeUserDescription: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var mapLocationView: UIView!
    var mapView: NMFMapView!
    
    @IBOutlet weak var bannerCV: UICollectionView!
    
    @IBOutlet weak var pumpkimImage: UIImageView!
    @IBOutlet weak var catchButton: UIButton!
    
    var isClickedCatchButton: Bool = false
    
    var nickText = ""
    var distanceText = ""
    var imageData = UIImage(named: "")
    var memoText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        mapView = NMFMapView(frame: CGRect(x: 0, y: 0, width: self.mapLocationView.frame.width, height: self.mapLocationView.frame.height))
        mapLocationView.layer.cornerRadius = 20
        
        
        mapLocationView.addSubview(mapView)
        
        
        self.costumeUserName.text = nickText
        self.costumeUserLocation.text = distanceText
        self.costumeUserDescription.text = memoText
        self.profileImageView.image = imageData
        
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: 37.359400, lng: 127.105530)
        marker.mapView = mapView

        
        catchButton.layer.cornerRadius = 20
        bannerCV.dataSource = self
        setBanner()
        
        bannerCV.backgroundColor = UIColor.black
        pumpkimImage.layer.cornerRadius = 25
        
        isClickedCatchButton = false
    }
    
    
    @IBAction func clickCatchButton(_ sender: UIButton) {
        self.showToast(message: "리스트에 저장됨")
        
        if isClickedCatchButton == false {
            isClickedCatchButton = true
            catchButton.setTitle("잡았다!", for:.normal)
            catchButton.backgroundColor = UIColor.gray
        }
    }
    
    
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}




// collectionView의 데이타를 관리하는 애
// 얘가 있어야 이미지, 텍스트, 등등의 리소스를 가져올 수 있음.
extension CostumeInfoViewController : UICollectionViewDataSource {
    
    // numberOfItemsInSection
    // 섹션의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 얘가 갖고 있는 리스트의 갯수만큼 반환해서 걔를 섹션으로 int 반환
        return appDelegate.bannerList.count
    }
    
    // 각각의 cell 에 들어갈 내용 정의
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // cell의 고유한 identifier
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! bannerCell
        
        let banner = appDelegate.bannerList[indexPath.row]
        
        // 각각의 셀에 들어갈 iboulet
        bannerCell.banner?.image = banner.bannerImg
        
        return bannerCell
    }
}

extension CostumeInfoViewController {
    func setBanner(){
        
        let banner1 = Banner(bannerName: "ghost01")
        let banner2 = Banner(bannerName: "ghost02")
        let banner3 = Banner(bannerName: "ghost03")
        let banner4 = Banner(bannerName: "ghost04")
        let banner5 = Banner(bannerName: "ghost05")
        let banner6 = Banner(bannerName: "ghost06")
//        let banner7 = Banner(bannerName: "img02")
//        let banner8 = Banner(bannerName: "img02")
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        delegate.bannerList = [banner1, banner2, banner3, banner4, banner5, banner6]
    }
}

extension CostumeInfoViewController {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}
