//
//  ViewController.swift
//  modering_c
//
//  Created by 大城　拓千 on 2017/11/16.
//  Copyright © 2017年 大城　拓千. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ViewController.timerUpdate), userInfo: nil, repeats: true)
    }
    @objc func timerUpdate() {
        print("update")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

