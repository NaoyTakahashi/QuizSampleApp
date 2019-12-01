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

    let choiceListView = Bundle.main.loadNibNamed("ChoiceList", owner: self, options: nil)!.first! as! ChoiceList
    let getQuizList = quizList()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func TapStartButton(_ sender: Any) {
    
        choiceListView.quizText.text = getQuizList.question[0]
        choiceListView.choiceOneButton.setTitle(getQuizList.choiceAnswer[0][0], for: .normal)
        choiceListView.choiceTwoButton.setTitle(getQuizList.choiceAnswer[0][1], for: .normal)
        choiceListView.choiceThreeButton.setTitle(getQuizList.choiceAnswer[0][2], for: .normal)
        choiceListView.frame = CGRect(x: 0, y: 80, width: 210, height: 500)
        choiceListView.backgroundColor = .red
        choiceListView.choiceOneButton.backgroundColor = .green
        choiceListView.choiceTwoButton.backgroundColor = .green
        choiceListView.choiceThreeButton.backgroundColor = .green
        self.view.addSubview(choiceListView)
    }
    
    
}

