//
//  ResultTableViewCellXib.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2020/01/13.
//  Copyright © 2020 高橋直也. All rights reserved.
//

import UIKit

class ResultTableViewCellXib: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var quizNo: UILabel!
    @IBOutlet weak var anser: UILabel!
    @IBOutlet weak var correctORIncorrect: UILabel!

}
