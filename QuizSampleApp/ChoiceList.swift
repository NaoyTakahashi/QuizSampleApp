//
//  ChoiceList.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/10/26.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class ChoiceList: UIView {
    
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    
    let choiceButtonsWidth = 90
    let choiceButtonsHeight = 50
    
    let quizText: QuizText = Bundle.main.loadNibNamed("QuizText", owner: self, options: nil)!.first! as! QuizText
    let getQuizList = quizList()
    let quizCount = quizList().quizID.count
    var idNumber = 0
    
    @IBAction func choiceOneTap(_ sender: Any) {
        idNumber += 1
        quizView()
        //quizTextAddSubview()
        //print("表示させるよ")
    }
    
    @IBAction func choiceTwoTap(_ sender: Any) {
        quizView()
//        quizTextisHiddenTrue()
//        print("表示を削除するよ")
    }
    
    @IBAction func choiceThreeTap(_ sender: Any) {
        quizView()
    }
    
    func quizView() {
    
        if quizCount == idNumber {
            choiceOneButton.removeFromSuperview()
            choiceTwoButton.removeFromSuperview()
            choiceThreeButton.removeFromSuperview()
            quizText.quizText.removeFromSuperview()
        } else {
            choiceOneButton.setTitle(getQuizList.choiceAnswer[idNumber][0], for: .normal)
            choiceTwoButton.setTitle(getQuizList.choiceAnswer[idNumber][1], for: .normal)
            choiceThreeButton.setTitle(getQuizList.choiceAnswer[idNumber][2], for: .normal)
            quizText.quizText.text = getQuizList.question[idNumber]
            quizText.frame = CGRect(x: 0, y: 20, width: 410, height: 200)
            addSubview(quizText)
            addSubview(choiceOneButton)
            addSubview(choiceTwoButton)
            addSubview(choiceThreeButton)
        }
        
    }
    
    func quizTextAddSubview() {
//        let quizText: QuizText
//        quizText = Bundle.main.loadNibNamed("QuizText", owner: self, options: nil)!.first! as! QuizText
        quizText.frame = CGRect(x: 0, y: 200, width: 410, height: 200)
        addSubview(quizText)
        quizText.quizText.isHidden = false
        
    }
    
    func quizTextisHiddenTrue() {
//        let quizText: QuizText
//        quizText = Bundle.main.loadNibNamed("QuizText", owner: self, options: nil)! .first! as! QuizText
        
        quizText.quizText.isHidden = true
    }

    override func draw(_ rect: CGRect) {
        let selfheight: CGFloat = 115
        let selfWidth: CGFloat = 415
        
        self.frame.size.height = selfheight
        self.frame.size.width = selfWidth

        
        let superScreen: CGRect = (self.window?.screen.bounds)!
        
    }
    

}
