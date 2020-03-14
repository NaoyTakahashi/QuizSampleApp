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
    
    @IBOutlet weak var answerTextOne: UILabel!
    @IBOutlet weak var answerTextTwo: UILabel!
    @IBOutlet weak var answerTextThree: UILabel!
    
    weak var delegate:ResultTableViewDelegate?
    var prop: mondai?
    var idNumber = 0
    var view = UIView()
    var quizAnser: String = ""
    var choice: String = ""
     
     @IBAction func choiceOneTap(_ sender: Any) {
        choice = answerTextOne.text!
        answerCheck(choice)
        idNumber += 1
        quizView()
     }
     
     @IBAction func choiceTwoTap(_ sender: Any) {
        choice = answerTextTwo.text!
        answerCheck(choice)
        idNumber += 1
        quizView()
     }
     
     @IBAction func choiceThreeTap(_ sender: Any) {
        choice = answerTextThree.text!
        answerCheck(choice)
        idNumber += 1
        quizView()
     }
    
     
    func quizView() -> String {
        let quizCount = prop?.Oya.count
        if quizCount == idNumber {
            removeQuizFieldItems()
            delegate?.toResultTableViewSegue()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
         } else {
            quizText.text = prop?.Oya[0].Questionsentence
            answerTextOne.text = prop?.Oya[0].Choices[0]
            answerTextTwo.text = prop?.Oya[0].Choices[1]
            answerTextThree.text = prop?.Oya[0].Choices[2]
            
//            choiceOneButton.setTitle(getQuizList.choiceAnswer[idNumber][0], for: .normal)
//            choiceTwoButton.setTitle(getQuizList.choiceAnswer[idNumber][1], for: .normal)
//            choiceThreeButton.setTitle(getQuizList.choiceAnswer[idNumber][2], for: .normal)
            
            if let Anser = prop?.Oya[0].Questionsentence {
                quizAnser = Anser
            }
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
//        result.caseId = getQuizList.caseId
//        result.caseTitle = getQuizList.caseTitle
//        result.quizId = getQuizList.quizId[idNumber]
//        result.question = getQuizList.question[idNumber]
//        result.anser = getQuizList.anser[idNumber]
        result.successOrfailure = successOrfailure
        result.choiceAnser = choiceAnser
        
        try! realm.write {
            realm.add(result)
        }
    }
    
    func removeQuizFieldItems() {
        quizText.removeFromSuperview()
        answerTextOne.removeFromSuperview()
        answerTextTwo.removeFromSuperview()
        answerTextThree.removeFromSuperview()
        choiceOneButton.removeFromSuperview()
        choiceTwoButton.removeFromSuperview()
        choiceThreeButton.removeFromSuperview()
    }
    
    func deleteAction() {
        let realm = try! Realm()
        //let deleteResult = realm.objects(Result.self)
//        let deletePlayedTestCaseFilterOn = realm.objects(PlayedTestCase.self).filter("caseId = \(getQuizList.caseId)")
//        let deleteResultFilterOn = realm.objects(Result.self).filter("caseId = \(getQuizList.caseId)")
//        try! realm.write {
//            realm.delete(deletePlayedTestCaseFilterOn)
//            realm.delete(deleteResultFilterOn)
//        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    

     override func draw(_ rect: CGRect) {
         let selfheight: CGFloat = 515
         let selfWidth: CGFloat = 415
         
         self.frame.size.height = selfheight
         self.frame.size.width = selfWidth

         
         let superScreen: CGRect = (self.window?.screen.bounds)!
         
     }
    
    func codableMondaiPlist() {
        if let url = Bundle.main.path(forResource: "mondai", ofType: "plist") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: url))
                self.prop = try PropertyListDecoder().decode(mondai.self, from: data)
            } catch let e {
                print("Reason: \(e)")
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
