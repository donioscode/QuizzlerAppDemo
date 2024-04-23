//
//  ViewController.swift
//  QuizzlerAppDemo
//
//  Created by doniyor normuxammedov on 21/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLB: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var questionLB: UILabel!
    @IBOutlet weak var choice2: UIButton!
    
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
   var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
       
    }
    @objc func updateUI() {
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        questionLB.text = quizBrain.getQuestionText()
        scoreLB.text = "Score: \(quizBrain.getScore())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        
    }
    
    
}

