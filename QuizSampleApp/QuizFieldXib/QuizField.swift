//
//  QuizField.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/12/01.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit
import Realm
import RealmSwift


class QuizField: UIView {

    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var quizText: UILabel!
    weak var segue:hoge?
    let getQuizList = quizList1()
    let quizCount = quizList1().quizId.count
    var idNumber = 0
    var view = UIView()
    var quizAnser: String = ""
    var titleText: String = ""
     
     @IBAction func choiceOneTap(_ sender: Any) {
        titleText = choiceOneButton.titleLabel!.text!
        answerCheck(titleText)
        idNumber += 1
        quizView()
     }
     
     @IBAction func choiceTwoTap(_ sender: Any) {
        titleText = choiceTwoButton.titleLabel!.text!
        answerCheck(titleText)
        idNumber += 1
        quizView()
     }
     
     @IBAction func choiceThreeTap(_ sender: Any) {
//        titleText = choiceThreeButton.titleLabel!.text!
//        answerCheck(titleText)
//        idNumber += 1
//        quizView()
        segue?.toResultTableViewSegue()
     }
    
     
     func quizView() -> String {
        //let hogea = ViewController()
        //let hoge = Bundle.main.loadNibNamed("Main", owner: self, options: nil)!.first! as! ViewController
        if quizCount == idNumber {
            choiceOneButton.removeFromSuperview()
            choiceTwoButton.removeFromSuperview()
            choiceThreeButton.removeFromSuperview()
            quizText.removeFromSuperview()
            
            print(Realm.Configuration.defaultConfiguration.fileURL!)
         } else {
            choiceOneButton.setTitle(getQuizList.choiceAnswer[idNumber][0], for: .normal)
            choiceTwoButton.setTitle(getQuizList.choiceAnswer[idNumber][1], for: .normal)
            choiceThreeButton.setTitle(getQuizList.choiceAnswer[idNumber][2], for: .normal)
            quizText.text = getQuizList.question[idNumber]
            quizAnser = String(getQuizList.anser[idNumber])
            print("\(idNumber) for \(quizCount)")
         }
        return quizAnser
     }
    
    func answerCheck(_ choiceAnser: String) {
        
        if quizAnser == choiceAnser {
            let success = "正解"
            sevedAnswe(success, choiceAnser)
            print("ture" + " quizAnser\(quizAnser)" + " choiceAnser\(choiceAnser)")
        } else {
            let failure = "不正解"
            sevedAnswe(failure, choiceAnser)
            print("fulse" + " quizAnser\(quizAnser)" + " choiceAnser\(choiceAnser)")
        }
    }
    
    func sevedAnswe(_ successOrfailure:String,_ choiceAnser: String) {
        let realm = try! Realm()
        let result = Result()
        result.caseId = getQuizList.caseId
        result.caseTitle = getQuizList.caseTitle
        result.quizId = getQuizList.quizId[idNumber]
        result.question = getQuizList.question[idNumber]
        result.anser = getQuizList.anser[idNumber]
        result.successOrfailure = successOrfailure
        result.choiceAnser = choiceAnser
        
        try! realm.write {
            realm.add(result)
        }
    }
    
    func deleteAction() {
        let realm = try! Realm()
        //let deleteResult = realm.objects(Result.self)
        let deletePlayedTestCaseFilterOn = realm.objects(PlayedTestCase.self).filter("caseId = \(getQuizList.caseId)")
        let deleteResultFilterOn = realm.objects(Result.self).filter("caseId = \(getQuizList.caseId)")
        try! realm.write {
            realm.delete(deletePlayedTestCaseFilterOn)
            realm.delete(deleteResultFilterOn)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
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
