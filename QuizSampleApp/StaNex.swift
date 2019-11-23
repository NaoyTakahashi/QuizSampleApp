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
    let choiceButton = Bundle.main.loadNibNamed("ChoiceList", owner: self, options: nil)!.first! as! ChoiceList
    let choiceListView = ChoiceList()
    let choiceButtonsWidth = 90
    let choiceButtonsHeight = 50
    let getQuizList = quizList()
    
    
    @IBAction func staNexTap(_ sender: Any) {
        
        if staNex.titleLabel?.text == "スタート" {
            quizText.quizText.text = getQuizList.question[0]
            choiceButton.choiceOneButton.setTitle(getQuizList.choiceAnswer[0][0], for: .normal)
            choiceButton.choiceTwoButton.setTitle(getQuizList.choiceAnswer[0][1], for: .normal)
            choiceButton.choiceThreeButton.setTitle(getQuizList.choiceAnswer[0][2], for: .normal)
            quizText.frame = CGRect(x: 0, y: 20, width: 410, height: 200)
            choiceButton.frame = CGRect(x: 0, y: 0, width: 410, height: 120)
            quizText.backgroundColor = .blue
            choiceButton.backgroundColor = .red
            addSubview(quizText)
            addSubview(choiceButton)

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
