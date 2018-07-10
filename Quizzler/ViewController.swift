////
////  ViewController.swift
////  Quizzler
////
////  Created by Sako Hovaguimian on 25/06/2018.
////  Copyright (c) 2018 Sako Hovaguimian. All rights reserved.


import UIKit

class ViewController: UIViewController {

    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0


    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressBarWC: NSLayoutConstraint!
    @IBOutlet weak var progressLabel: UILabel!

    override func viewDidLoad() {

        super.viewDidLoad()
       nextQuestion()

    }

    @IBAction func answerPressed(_ sender: AnyObject) {
       if sender.tag == 1 {
         pickedAnswer = true
     }
    else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()

       questionNumber = questionNumber + 1
       nextQuestion()
   }


   func updateUI() {

     scoreLabel.text = "score: \(score)"
       progressLabel.text = "\(questionNumber + 1) / 13 "

       let questionIndex = CGFloat(questionNumber + 1)
       let questionCount = CGFloat(allQuestions.list.count)
       let width = ((self.view.bounds.width / questionCount) * questionIndex)

       progressBarWC.constant = width
        UIView.animate(withDuration: 0.1) {
          self.progressBar.superview?.layoutIfNeeded()
        }

   }


   func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
           updateUI()
       } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finashed all the questions! Would you like to restart the quiz?", preferredStyle: .alert)

            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion:  nil)        }
    }

    func checkAnswer() {

        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Way To Go! ")
            score += 1
        } else {
            ProgressHUD.showError("Incorrect")
        }

    }


    func startOver() {
       score = 0
       questionNumber = 0
       nextQuestion()

    }


}
