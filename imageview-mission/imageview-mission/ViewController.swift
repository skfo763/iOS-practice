//
//  ViewController.swift
//  imageview-mission
//
//  Created by MOZZET on 2020/02/02.
//  Copyright © 2020 skfo763. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var imageIndex = 0
    private var imageList: [UIImage] = []
    private var isCircular = false
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var circularStateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setImage()
        imageView.image = imageList[0]
    }
    
    private func setImage() {
        for i in (1...6) {
            let imageName = String(i) + ".png"
            if let uiImage = UIImage(named: imageName) {
                imageList.append(uiImage)
            }
        }
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        if(imageIndex >= 5) {
            if(!isCircular) { return }
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = imageList[imageIndex]
        subTitleLabel.text = "Image " + String(imageIndex+1)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        if(imageIndex <= 0) {
            if(!isCircular) { return }
            imageIndex = 5
        } else {
            imageIndex -= 1
        }
        imageView.image = imageList[imageIndex]
        subTitleLabel.text = "Image " + String(imageIndex+1)
    }
    
    @IBAction func changeCircularState(_ sender: UISwitch) {
        
        if(sender.isOn) {
            isCircular = true
            circularStateLabel.text = "Circular"
        } else {
            isCircular = false
            circularStateLabel.text = "Static"
        }
    }
}

