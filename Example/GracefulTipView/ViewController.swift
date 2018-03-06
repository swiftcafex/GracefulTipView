//
//  ViewController.swift
//  GracefulTipView
//
//  Created by galaxys45312 on 03/05/2018.
//  Copyright (c) 2018 galaxys45312. All rights reserved.
//

import UIKit
import GracefulTipView

class ViewController: UIViewController {

    var tipView: GracefulTipView?
    var testBottomButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tipView = GracefulTipView(frame: CGRect.zero)
        tipView.tipText = "点击开始扫描"
        self.view.addSubview(tipView)
        self.tipView = tipView
        
        let testBottomButton = UIButton(frame: CGRect.zero)
        testBottomButton.setImage(UIImage(named: "btn_camera"), for: .normal)
        self.view.addSubview(testBottomButton)
        self.testBottomButton = testBottomButton
        
        tipView.floatAboveOf(view: testBottomButton)
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        self.tipView?.frame = CGRect(x: 20, y: 20, width: 100, height: 30)
        self.testBottomButton?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.testBottomButton?.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height - 100)
        
    }

}

