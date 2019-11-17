//
//  ViewController.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/10/26.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var startButton: StaNex
        startButton = Bundle.main.loadNibNamed("StaNex", owner: self, options: nil)!.first! as! StaNex
        startButton.staNex.setTitle("スタート", for: .normal)
        
        self.view.addSubview(startButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

