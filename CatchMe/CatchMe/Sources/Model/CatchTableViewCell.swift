//
//  CatchTableViewCell.swift
//  CatchMe
//
//  Created by 남수김 on 2019/11/03.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit

class CatchTableViewCell: UITableViewCell {

    @IBOutlet weak var nickLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backView.layer.cornerRadius = 10
        self.imgView.layer.cornerRadius = self.imgView.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
