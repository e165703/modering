//
//  ViewController.swift
//  test1
//
//  Created by Kai Uehara on 2017/12/06.
//  Copyright © 2017年 team_c. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var clocklabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(nowtime), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func nowtime() {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss:SS"
        clocklabel.text = formatter.string(from: now)
    }
}

