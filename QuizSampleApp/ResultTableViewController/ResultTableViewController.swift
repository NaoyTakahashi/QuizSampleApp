//
//  ResultTableViewController.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2019/12/21.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ResultTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var resultList: Results<Result>!

    @IBOutlet var resultListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        resultListTableView.dataSource = self
        resultListTableView.delegate = self
        
        do {
            let realm = try! Realm()
            resultList = realm.objects(Result.self)
            resultListTableView.reloadData()
        } catch {
            
        }
        
        self.resultListTableView.register(UINib(nibName: "ResultTableViewCellXib", bundle: nil), forCellReuseIdentifier: "ResultTableViewCellXib")
        self.resultListTableView.register(UINib(nibName: "CorrectAnswerRateCellXib", bundle: nil), forCellReuseIdentifier: "CorrectAnswerRateCellXib")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch(section) {
        case 0:
            return 1
        case 1:
            return resultList.count
        default:
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let correctAnswerRateCell = tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerRateCellXib", for: indexPath) as! CorrectAnswerRateCellXib
        
        let resultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCellXib", for: indexPath) as! ResultTableViewCellXib
        let resultObject = resultList[indexPath.row]
        
        
        switch(indexPath.section) {
        case 0:
            let realm = try! Realm()
            let correctAnswerCount = realm.objects(Result.self).filter("successOrfailure == '正解'")
            var retrunCorrectAnswerWord = "\(resultList.count)問中\(correctAnswerCount.count)問正解"
            correctAnswerRateCell.correctAnswerRateLable.text = retrunCorrectAnswerWord
            return correctAnswerRateCell
        case 1:
            resultTableViewCell.quizNo?.text = String(resultObject.quizId)
            resultTableViewCell.anser?.text = "\(resultObject.choiceAnser)"
            resultTableViewCell.correctORIncorrect?.text = resultObject.successOrfailure

            return resultTableViewCell
        default:
            return correctAnswerRateCell
        }

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return nil
        case 1:
            return "解答"
        default:
            return nil
        }
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
