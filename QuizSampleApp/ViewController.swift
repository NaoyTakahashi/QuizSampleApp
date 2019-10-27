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
        
        var choiceList: ChoiceList
        choiceList = Bundle.main.loadNibNamed("ChoiceList", owner: self, options: nil)!.first! as! ChoiceList
        choiceList.choiceOne.setTitle("変えてみた", for: .normal)
        
        //self.view.addSubview(quizTextView)
        self.view.addSubview(choiceList)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

