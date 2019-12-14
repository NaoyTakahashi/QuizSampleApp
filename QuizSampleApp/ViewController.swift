//
//  ViewController.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/10/26.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var StartButton: UIButton!

    let choiceListView = Bundle.main.loadNibNamed("QuizField", owner: self, options: nil)!.first! as! QuizField
    let getQuizList = quizList1()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func TapStartButton(_ sender: Any) {
        choiceListView.quizView()
        self.StartButton.removeFromSuperview()
        self.view.addSubview(choiceListView)
    }
    
    
}

