//
//  QuizField.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/12/01.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class QuizField: UIView {

    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var quizText: UILabel!

    let getQuizList = quizList()
    let quizCount = quizList().quizID.count
    var idNumber = 0
    var view = UIView()
    var quizAnser: String = ""
    var titleText: String = ""
     
     
     @IBAction func choiceOneTap(_ sender: Any) {
        titleText = choiceOneButton.titleLabel!.text!
        answerCheck(titleText)
        quizView()
     }
     
     @IBAction func choiceTwoTap(_ sender: Any) {
        titleText = choiceTwoButton.titleLabel!.text!
        answerCheck(titleText)
        quizView()
     }
     
     @IBAction func choiceThreeTap(_ sender: Any) {
        titleText = choiceThreeButton.titleLabel!.text!
        answerCheck(titleText)
        quizView()
     }
     
     func quizView() -> String {
         idNumber += 1
         if quizCount == idNumber {
             choiceOneButton.removeFromSuperview()
             choiceTwoButton.removeFromSuperview()
             choiceThreeButton.removeFromSuperview()
             quizText.removeFromSuperview()
         } else {
            choiceOneButton.setTitle(getQuizList.choiceAnswer[idNumber][0], for: .normal)
            choiceTwoButton.setTitle(getQuizList.choiceAnswer[idNumber][1], for: .normal)
            choiceThreeButton.setTitle(getQuizList.choiceAnswer[idNumber][2], for: .normal)
            quizText.text = getQuizList.question[idNumber]
            quizAnser = String(getQuizList.anser[idNumber])
            print(idNumber)
            print(quizCount)
         }
        return quizAnser
     }
    
    func answerCheck(_ choiceAnser: String) {
        
        if quizAnser == choiceAnser {
            print("ture")
            print("quizAnser\(quizAnser)")
            print("choiceAnser\(choiceAnser)")
        } else {
            print("fulse")
            print("quizAnser\(quizAnser)")
            print("choiceAnser\(choiceAnser)")
        }
    }

     override func draw(_ rect: CGRect) {
         let selfheight: CGFloat = 515
         let selfWidth: CGFloat = 415
         
         self.frame.size.height = selfheight
         self.frame.size.width = selfWidth

         
         let superScreen: CGRect = (self.window?.screen.bounds)!
         
     }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
