//
//  ChoiceList.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/10/26.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class ChoiceList: UIView {
    
    
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    
    let quizText: QuizText = Bundle.main.loadNibNamed("QuizText", owner: self, options: nil)!.first! as! QuizText
    let getQuizList = quizList()
    
    @IBAction func choiceOneTap(_ sender: Any) {
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
    
    func choiceHiddenTrue() {
        choiceOne.isHidden = true
        choiceTwo.isHidden = true
        choiceThree.isHidden = true
    }
    
    func quizView() {
    
        var idNumber = 0
        choiceOne.titleLabel?.text = getQuizList.choiceAnswer[idNumber][0]
        choiceTwo.titleLabel?.text = getQuizList.choiceAnswer[idNumber][0]
        choiceThree.titleLabel?.text = getQuizList.choiceAnswer[idNumber][0]
        quizText.quizText.text = getQuizList.question[idNumber]
        quizText.frame = CGRect(x: 0, y: 200, width: 410, height: 200)
        addSubview(quizText)

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
