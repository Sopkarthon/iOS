//
//  Banner.swift
//  CatchMe
//
//  Created by 최은지 on 03/11/2019.
//  Copyright © 2019 ns. All rights reserved.
//

import Foundation
import UIKit

struct Banner {
    var bannerImg: UIImage?
    
    init(bannerName: String){
        self.bannerImg = UIImage(named: bannerName)
    }
}
