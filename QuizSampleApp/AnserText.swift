//
//  AnserButton.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/10/26.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class AnserText: UIView {

    @IBOutlet weak var yourAnser: UILabel!
    @IBOutlet weak var yourChoiceAnser: UILabel!
    
    @IBOutlet weak var correctAnswerLable: UILabel!
    @IBOutlet weak var correctAnwer: UILabel!
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let selfheight: CGFloat = 60
        let selfwidth: CGFloat = 380
        
        self.frame.size.height = selfheight
        self.frame.size.width = selfwidth
        
        let superScreen: CGRect = (self.window?.screen.bounds)!
        
    }
    

}
