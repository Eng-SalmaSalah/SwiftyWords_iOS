//
//  ViewController.swift
//  SwiftyWords
//
//  Created by Salma Salah on 2/23/20.
//  Copyright © 2020 Salma Salah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //here we defined them as forced unwrapped to avoid check each time i use them,but i must be sure that i give them values before using them,for example : scoreLabel = UILabel()
    var scoreLabel : UILabel!
    var cluesLabel : UILabel!
    var answersLabel : UILabel!
    var currentAnswer : UITextField!
    var letterButtons = [UIButton]()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        addSubViews()
    }
    
    func addSubViews(){
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score : 0"
        view.addSubview(scoreLabel)
        
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.text = "CLUES"
        cluesLabel.numberOfLines = 0 // to make the label take many lines to fit its content
//        cluesLabel.backgroundColor = .red
        //setContentHuggingPriority to avoid the random choice of autolayout to stretch one of the subviews
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        //here we decreased content hugging priority for the answers and clue labels to make them stretch to fill the empty spaces
        view.addSubview(cluesLabel)
        
        answersLabel = UILabel()
        answersLabel.translatesAutoresizingMaskIntoConstraints = false
        answersLabel.textAlignment = .right
        answersLabel.font = UIFont.systemFont(ofSize: 24)
        answersLabel.text = "ANSWERS"
        answersLabel.numberOfLines = 0
//        answersLabel.backgroundColor = .blue
        answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(answersLabel)
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.font = UIFont.systemFont(ofSize: 24)
        currentAnswer.placeholder = "Tap Letters To Guess!"
        currentAnswer.textAlignment = .center
        currentAnswer.isUserInteractionEnabled = false //to prevent user to type from keyboard
        view.addSubview(currentAnswer)
        
        
        //we will declare submit and clear buttons here not as properties in the VC because we will not modify them later according to game state
        let submitButton = UIButton(type: .system)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Submit", for: .normal)
        view.addSubview(submitButton)
        
        let clearButton = UIButton(type: .system)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("Clear", for: .normal)
        view.addSubview(clearButton)
        
        //to add letter buttons view
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
//        buttonsView.backgroundColor = .green
        view.addSubview(buttonsView)
        
        
        //to add constraints
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor,multiplier: 0.6, constant: -100),
            
            answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100), //to leave space from the right edge(negative : move to left)
            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100), //this constant is for the space left
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            
            currentAnswer.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
            
            submitButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 44),//recommended by apple to make user tap on it easily
            submitButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: -100),//move it to left
            
            clearButton.centerYAnchor.constraint(equalTo: submitButton.centerYAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 44),
            clearButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 100),//move it to right
            
            buttonsView.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant:20),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20), //move it to up
            buttonsView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320)
   
        ])//layoutMarginsGuide to leave small margin between controls and safe area
        
        //add letter buttons:
        let btnWidth = 150
        let btnHeight = 80
        
        for row in 0..<4 {
            for column in 0..<5 //up to but excluding 5
            {
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("WWW", for: .normal)
                //never use  ->  letterButton.titleLabel?.text = "WWW"
                
                let frame = CGRect(x: column * btnWidth, y: row * btnHeight, width: btnWidth, height: btnHeight)
                letterButton.frame = frame
                
                buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

