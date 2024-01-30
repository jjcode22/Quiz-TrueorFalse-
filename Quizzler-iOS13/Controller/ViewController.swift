//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var quizScore: UILabel!

    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = 0.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userIsRight = quizBrain.checkAnswer(userAnswer)
        
        if userIsRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
     
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
//        updateUI()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
//            self.updateUI()
//        }
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let options = quizBrain.getOptions()
        optionOne.setTitle(options[0], for: .normal)
        optionTwo.setTitle(options[1], for: .normal)
        optionThree.setTitle(options[2], for: .normal)
        optionTwo.backgroundColor = UIColor.clear
        optionThree.backgroundColor = UIColor.clear
        optionOne.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        quizScore.text = "Score: \(quizBrain.getScore())"
        
        
    }


}

