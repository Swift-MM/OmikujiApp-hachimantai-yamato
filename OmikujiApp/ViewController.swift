//
//  ViewController.swift
//  OmikujiApp
//
//  Created by 大和芳隆 on 2016/11/12.
//  Copyright © 2016年 BETA-yamato. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var stickView: UIView!

    @IBOutlet weak var stickLabel: UILabel!
    
    @IBOutlet weak var stickHeight: NSLayoutConstraint!
    
    @IBOutlet weak var stickBottomMargin: NSLayoutConstraint!

        let resultTextArray: [String] = [
        "大吉",
        "中吉",
        "小吉",
        "吉",
        "末吉",
        "凶",
        "大凶"
    ]
}

override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
    
    if motion != UIEventSubtype.motionShake || overView.isHidden == false{
        // シェイクモーション以外では動作させない
        return
    }
    
    let resultNum = Int( arc4random_uniform(UInt32(resultTexts.count)) )
    stickLabel.text = resultTexts[resultNum]
    stickBottomMargin.constant = stickHeight.constant * -1
    
    UIView.animate(withDuration: 1, animations: {
        
        self.view.layoutIfNeeded()
        
    }, completion: { (finished: Bool) in
        // 後ほど記述します。
        self.bigLabel.text = self.stickLabel.text
        self.overView.isHidden = false
    })
}




    @IBAction func tapRetryButton(_ sender: UIButton) {
        
        overView.isHidden = true
        stickBottomMargin.constant = 0
        
    }
    
    
    @IBOutlet weak var overView: UIView!
    
    @IBOutlet weak var bigLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 音の準備
        setupSound()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

