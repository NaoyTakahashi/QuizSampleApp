//
//  NextButton.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/10/26.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class NextButton: UIView {

    @IBOutlet weak var Next: UIButton!

    @IBAction func nextButtonTap(_ sender: Any) {
        Next.removeFromSuperview()
        choiceListHiddenFalse()
        //anserTextisHiddenTrue()
        
    }
    
    func choiceListHiddenFalse() {
        let choiceButton: ChoiceList
        choiceButton = Bundle.main.loadNibNamed("ChoiceList", owner: self, options: nil)!.first! as! ChoiceList
        choiceButton.choiceOne.setTitle("変えてみた", for: .normal)
        choiceButton.backgroundColor = .red
        
        addSubview(choiceButton)
    }
    
    func anserTextisHiddenTrue() {
        let anserTextisHiddenT: AnserText
        anserTextisHiddenT = Bundle.main.loadNibNamed("AnserText", owner: self, options: nil)! .first! as! AnserText
        
        anserTextisHiddenT.removeFromSuperview()
    }
    

    override func draw(_ rect: CGRect) {
        let selfheight: CGFloat = 120
        let selfWidth: CGFloat = 410
        
        self.frame.size.height = selfheight
        self.frame.size.width = selfWidth
//        self.frame.origin.x = 0
//        self.frame.origin.y = 50
        
        let superScreen: CGRect = (self.window?.screen.bounds)!
        
        
    }
    

}
