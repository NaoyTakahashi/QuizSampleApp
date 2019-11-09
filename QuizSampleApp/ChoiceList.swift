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
    
    @IBAction func choiceOneTap(_ sender: Any) {
        quizTextAddSubview()
        print("表示させるよ")
    }
    
    @IBAction func choiceTwoTap(_ sender: Any) {
        quizTextisHiddenTrue()
        print("表示を削除するよ")
    }
    
    @IBAction func choiceThreeTap(_ sender: Any) {
    }
    
    func choiceHiddenTrue() {
        choiceOne.isHidden = true
        choiceTwo.isHidden = true
        choiceThree.isHidden = true
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
