//
//  ViewController.swift
//  datepicker-practice
//
//  Created by MOZZET on 2020/02/02.
//  Copyright © 2020 skfo763. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet var chosenTimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        Timer.scheduledTimer(
            // 타이머 간격
            timeInterval: interval,
            // 타이머가 동작될 view
            target: self,
            // 타이머가 돌아갈  때 구동될 함수.
            selector: timeSelector,
            // 사용자 정보
            userInfo: nil,
            // 반복 여부
            repeats: true)
    }

    @IBAction func chooseDateTime(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        chosenTimeLabel.text = "선택 시간: " + formatter.string(from: sender.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        currentTimeLabel.text = "현재 시간: " +
            formatter.string(from: date as Date)
    }
    
}

