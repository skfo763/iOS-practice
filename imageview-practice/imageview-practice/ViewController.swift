//
//  ViewController.swift
//  imageview-practice
//
//  Created by MOZZET on 2020/01/31.
//  Copyright © 2020 skfo763. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false
    var imageOn: UIImage?
    var imageOff: UIImage?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var resizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageOn = UIImage(named: "lamp_on.png")
        imageOff = UIImage(named: "lamp_off.png")
        imageView.image = imageOn
    }

    @IBAction func resizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if(isZoom) {
            // 이미지가 이미 확대되어 있다면 -> 이미지를 축소합니다.
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale
            
            // 버튼의 텍스트를 'expand'로 바꿉니다.
            resizeButton.setTitle("expand", for: .normal)
        } else {
            // 이미지가 축소된 상태라면 -> 이미지를 확대합니다.
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
            
            // 버튼의 텍스트를 'reduce'로 바꿉니다.
            resizeButton.setTitle("reduce", for: .normal)
        }
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImateState(_ sender: UISwitch) {
        if sender.isOn {
            imageView.image = imageOn
        } else {
            imageView.image = imageOff
        }
    }
}

