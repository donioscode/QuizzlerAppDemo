//
//  ViewController.swift
//  QuizzlerAppDemo
//
//  Created by doniyor normuxammedov on 21/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLB: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var questionLB: UILabel!
    @IBOutlet weak var falseBtn: UIButton!
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
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
//                sender.backgroundColor = .clear
//             }
        } else {
            sender.backgroundColor = .red
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
//                sender.backgroundColor = .clear
//             }
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
       
    }
    @objc func updateUI() {
        questionLB.text = quizBrain.getQuestionText()
        scoreLB.text = "Score: \(quizBrain.getScore())"
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor .clear
        progressBar.progress = quizBrain.getProgress()
    }
    
    
}

