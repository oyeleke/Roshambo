//
//  ViewController.swift
//  Roshambo
//
//  Created by user on 04/08/2018.
//  Copyright © 2018 Ogunsola Timileyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rockButtonClicked(_ sender: Any) {
        let controller : AnswerViewController
        
        controller = storyboard?.instantiateViewController(withIdentifier: "AnswerViewController") as! AnswerViewController
        
        controller.usersChoice = 0
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func paperButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "choosePaper", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! AnswerViewController
        controller.usersChoice = 1
    }
}

