//
//  MainViewController.swift
//  CatchMe
//
//  Created by 윤동민 on 2019/11/03.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var catchMeButton: UIButton!
    private var isClick: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialButton()
    }
    
    private func initialButton() {
        yesButton.layer.cornerRadius = yesButton.frame.width / 2
        noButton.layer.cornerRadius = noButton.frame.width / 2
        catchMeButton.layer.cornerRadius = catchMeButton.frame.width / 11
    }
    
    @IBAction func clickButton(_ sender: Any) {
        isClick = true
        guard let button = sender as? UIButton else { return }
        switch button {
        case yesButton:
            if isClick == true {
                noButton.backgroundColor = .white
                noButton.setTitleColor(UIColor(red: 251/255, green: 82/255, blue: 16/255, alpha: 1), for: .normal)
            }
        case noButton:
            if isClick == true {
                yesButton.backgroundColor = .white
                yesButton.setTitleColor(UIColor(red: 251/255, green: 82/255, blue: 16/255, alpha: 1), for: .normal)
            }
        default: return
        }
        button.backgroundColor = UIColor(red: 251/255, green: 82/255, blue: 16/255, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
    @IBAction func clickCatchMeButton(_ sender: Any) {
        catchMeButton.backgroundColor = UIColor(red: 251/255, green: 82/255, blue: 16/255, alpha: 1)
        catchMeButton.setTitleColor(UIColor.white, for: .normal)
    }
}
