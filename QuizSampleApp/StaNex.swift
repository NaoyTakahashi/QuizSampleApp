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
    let choiceButtom = Bundle.main.loadNibNamed("ChoiceList", owner: self, options: nil)!.first! as! ChoiceList
    let getQuizList = quizList()
    
    
    @IBAction func staNexTap(_ sender: Any) {
        
        if staNex.titleLabel?.text == "スタート" {
            quizText.quizText.text = getQuizList.question[0]
            choiceButtom.choiceOne.titleLabel?.text = getQuizList.choiceAnswer[0][0]
            choiceButtom.choiceTwo.titleLabel?.text = getQuizList.choiceAnswer[0][1]
            choiceButtom.choiceThree.titleLabel?.text = getQuizList.choiceAnswer[0][2]
            quizText.frame = CGRect(x: 0, y: 200, width: 410, height: 200)
            addSubview(quizText)
            addSubview(choiceButtom)
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
