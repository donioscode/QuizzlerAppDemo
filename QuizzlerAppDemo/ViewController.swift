//
//  ViewController.swift
//  QuizzlerAppDemo
//
//  Created by doniyor normuxammedov on 21/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var questionLB: UILabel!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questionNumber = 0
    let quiz = [
        [ "Four + Two is equal to Six","True"],
        [ "Approximately one quarter of human bones are in the feet.","True"],
        [ "You can lead a cow down stairs but not up stairs.","True"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("Right")
        } else {
            print("Wrong")
        }
        
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        updateUI()
        
    }
    func updateUI() {
        questionLB.text = quiz[questionNumber][0]
    }
    
}

