//
//  ViewController.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/10/26.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {

    
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var deleteALLButton: UIButton!
    @IBAction func deleteALLAction(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        choiceListView.deleteAction()
    }
    
    
    let choiceListView = Bundle.main.loadNibNamed("QuizField", owner: self, options: nil)!.first! as! QuizField
    let getQuizList = quizList1()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func TapStartButton(_ sender: Any) {
        choiceListView.deleteAction()
        choiceListView.quizView()
        tryCaseTitle()
        self.StartButton.removeFromSuperview()
        self.view.addSubview(choiceListView)
    }
    
    func tryCaseTitle() {
        let realm = try! Realm()
        let plaiedTestCase = PlayedTestCase()
        plaiedTestCase.caseId = getQuizList.caseId
        plaiedTestCase.caseTitle = getQuizList.caseTitle
        try! realm.write {
            realm.add(plaiedTestCase) //各変数に代入した値をRealmに書き込む
        }
    }
}

