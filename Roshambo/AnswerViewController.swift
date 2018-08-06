//
//  AnswerViewController.swift
//  Roshambo
//
//  Created by user on 04/08/2018.
//  Copyright © 2018 Ogunsola Timileyin. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var resultLabelView: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    var isVictory : Bool!
    var message : String!
    let imageStrings = ["itsATie", "PaperCoversRock", "RockCrushesScissors", "ScissorsCutPaper"]
    var image : String!
    var usersChoice : Int!
    var systemChoice : Int!
    
    enum ButtonType: Int {
        case rock = 0, paper, scissors
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        systemChoice = randomSystemValue()
        decideResult(usersChoice: usersChoice, systemsChoice: systemChoice)

        // Do any additional setup after loading the view.
    }
    
    func decideResult(usersChoice users: Int = 2, systemsChoice systems: Int){
        
        switch ButtonType(rawValue: users)! {
        case .rock:
            if systems == 1 {
                isVictory = false
                message = "Paper covers rock"
                image = imageStrings[1]
            }else if systems == 0 {
                isVictory = false
                message = "its a tie"
                image = imageStrings[0]
            }
            else{
                isVictory = true
                message = "Rock crushes scissors"
                image = imageStrings[2]
            }
        case .paper:
            if systems == 0 {
                isVictory = true
                message = "Paper covers rock"
                image = imageStrings[1]
            }else if systems == 2{
                isVictory = false
                message = "Scissors cuts paper"
                image = imageStrings[3]
            }
            else{
                isVictory = false
                message = "its a tie"
                image = imageStrings[1]
            }
        case .scissors:
            if systems == 1 {
                isVictory = true
                message = "Scissors cuts paper"
                image = imageStrings[3]
            }else if systems == 0 {
                isVictory = false
                message = "Rock crushes scissors"
                image = imageStrings[2]
            }
            else{
                isVictory = false
                message = "its a tie"
                image = imageStrings[0]
            }
        }
        if isVictory {
            message = message! + ", you win"
        }else {
            if message != "its a tie"{
                message = message! + ", you lose"
            }
        }
        setImageAndLabelViews(label: message, image: image)
    }
    
    func setImageAndLabelViews (label : String, image : String){
        resultLabelView.text = label
        resultImageView.image = UIImage(named: image)
    }
    
    func randomSystemValue() -> Int {
        let random = arc4random_uniform(3)
        return Int(random)
    }

    //MARK - Actions for buttons
    @IBAction func playAgainButtonClicked(_ sender : Any){
        dismiss(animated: true, completion: nil)
    }
    
}
