//
//  DemoViewController.swift
//  WTProgressViewDemo
//
//  Created by Wasi Tariq on 27/12/2017.
//  Copyright © 2017 Wasi Tariq. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    let progressView = WTProgressView(frame: CGRect(x: 50 , y: 50 , width : 200 , height : 10), fillColor: UIColor.red, value: 50, hasIndicatorBar: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        progressView.backgroundColor = UIColor.clear
        self.view.addSubview(progressView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(animateProgressView))
        self.view.addGestureRecognizer(tap)
    }

    @objc func animateProgressView()
    {
        progressView.animateTo(value: 50, duration: 1)
    }


}

