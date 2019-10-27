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
    
    @IBAction func choiceOneTap(_ sender: Any) {
        choiceHiddenTrue()
        anserTextisHiddenFalse()
        nextButtonHidednFalse()
        print("押せちゃってるよ")
    }
    
    @IBAction func choiceTwoTap(_ sender: Any) {
        quizTextisHiddenTrue()
        
    }
    
    @IBAction func choiceThreeTap(_ sender: Any) {
    }
    
    func choiceHiddenTrue() {
        choiceOne.isHidden = true
        choiceTwo.isHidden = true
        choiceThree.isHidden = true
    }
    
    func nextButtonHidednFalse() {
        let nextButton: NextButton
        nextButton = Bundle.main.loadNibNamed("NextButton", owner: self, options: nil)!.first! as! NextButton
        nextButton.backgroundColor = .blue
        addSubview(nextButton)
    }
    
    func quizTextisHiddenFalse() {
        let quizText: QuizText
        quizText = Bundle.main.loadNibNamed("QuizText", owner: self, options: nil)!.first! as! QuizText
        
        addSubview(quizText)
    }
    
    func quizTextisHiddenTrue() {
        let quizText: QuizText
        quizText = Bundle.main.loadNibNamed("QuizText", owner: self, options: nil)! .first! as! QuizText
        
        delete(quizText)
    }
    
    func anserTextisHiddenFalse() {
        let anserTextisHiddenF: AnserText
        anserTextisHiddenF = Bundle.main.loadNibNamed("AnserText", owner: self, options: nil)! .first! as! AnserText
        
        addSubview(anserTextisHiddenF)
        
    }

    override func draw(_ rect: CGRect) {
        let selfheight: CGFloat = 115
        let selfWidth: CGFloat = 415
        
        self.frame.size.height = selfheight
        self.frame.size.width = selfWidth

        
        let superScreen: CGRect = (self.window?.screen.bounds)!
        
    }
    

}
