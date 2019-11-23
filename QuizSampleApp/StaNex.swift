//
//  StaNex.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/11/17.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class StaNex: UIView {

    @IBOutlet weak var staNex: UIButton!
    
    let quizText: QuizText = Bundle.main.loadNibNamed("QuizText", owner: self, options: nil)!.first! as! QuizText
    let choiceListView = Bundle.main.loadNibNamed("ChoiceList", owner: self, options: nil)!.first! as! ChoiceList
    let choiceButtonsWidth = 90
    let choiceButtonsHeight = 50
    let getQuizList = quizList()
    
    
    @IBAction func staNexTap(_ sender: Any) {
        
        if staNex.titleLabel?.text == "スタート" {
            quizText.quizText.text = getQuizList.question[0]
            choiceListView.choiceOneButton.setTitle(getQuizList.choiceAnswer[0][0], for: .normal)
            choiceListView.choiceTwoButton.setTitle(getQuizList.choiceAnswer[0][1], for: .normal)
            choiceListView.choiceThreeButton.setTitle(getQuizList.choiceAnswer[0][2], for: .normal)
            quizText.frame = CGRect(x: 0, y: 20, width: 410, height: 200)
            choiceListView.frame = CGRect(x: 0, y: 0, width: 410, height: 120)
            quizText.backgroundColor = .blue
            choiceListView.backgroundColor = .red
            addSubview(quizText)
            addSubview(choiceListView)

        }
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
