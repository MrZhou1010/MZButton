//
//  ViewController.swift
//  MZButton
//
//  Created by Mr.Z on 2019/11/29.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupUI()
    }

    private func setupUI() {
        for i in 0 ..< 4 {
            let button1: UIButton = UIButton(type: .custom)
            button1.frame = CGRect(x: 20, y: 100 + (80 + 20) * i, width: 120, height: 80)
            button1.setTitle("微信", for: .normal)
            button1.setTitleColor(UIColor.black, for: .normal)
            button1.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            button1.setImage(UIImage(named: "wechat"), for: .normal)
            button1.layoutButtonWithEdgeInsets(style: MZButtonEdgeInsetsStyle(rawValue: i)!, imageTitleSpace: 10)
            button1.layer.borderColor = UIColor.gray.cgColor
            button1.layer.borderWidth = 1
            button1.layer.masksToBounds = true
            self.view.addSubview(button1)
            
            let button2: MZButton = MZButton(type: .custom)
            button2.frame = CGRect(x: 200, y: 100 + (80 + 20) * i, width: 120, height: 80)
            button2.setTitle("微信", for: .normal)
            button2.setTitleColor(UIColor.black, for: .normal)
            button2.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            button2.setImage(UIImage.init(named: "wechat"), for: .normal)
            button2.buttonEdgeInsetsType = MZButtonEdgeInsetsType(rawValue: i)!
            button2.imageSize = CGSize(width: 50,height: 50)
            button2.spacing = 5
            button2.layer.borderColor = UIColor.lightGray.cgColor
            button2.layer.borderWidth = 1
            button2.layer.masksToBounds = true
            self.view.addSubview(button2)
        }
    }
}

