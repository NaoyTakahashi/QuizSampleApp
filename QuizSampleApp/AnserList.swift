//
//  AnserList.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/12/12.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class PlayedTestCase: Object {
    @objc dynamic var caseId = 0
    @objc dynamic var caseTitle = ""
    
//    override class func primaryKey() -> String {
//        return "caseId"
//    }
}

class Result: Object {
    @objc dynamic var caseId = 0
    @objc dynamic var caseTitle = "" //問題のケース
    @objc dynamic var quizId = 0 //問題のID
    @objc dynamic var question = "" //問題
    @objc dynamic var choiceAnser = ""
    @objc dynamic var successOrfailure = ""
    @objc dynamic var anser:String = "" //解答
    
//    override class func primaryKey() -> String {
//        return "caseId"
//    }
}

//struct ResultSt {
//    var caseId = 0
//    var caseTitle = ""
//    var quizId:[Int] = []
//    var question:[String] = []
//    var userAnswer: [String] = []
//    var anser:[String] = []
//}

