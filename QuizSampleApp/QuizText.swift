//
//  QuizText.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/10/26.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class QuizText: UIView {

    @IBOutlet weak var quizText: UILabel!
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let selfWidth: CGFloat = 410
        let selfheidht: CGFloat = 170
        
        self.frame.size.height = selfheidht
        self.frame.size.width = selfWidth
        
        let superScreen: CGRect = (self.window?.screen.bounds)!
        
    }
    

}
