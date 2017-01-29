//
//  ViewController.swift
//  War
//
//  Created by Ilija Eftimov on 28/01/17.
//  Copyright © 2017 Ilija Eftimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    var rightScore = 0 {
        didSet {
           rightScoreLabel.text = String(rightScore)
        }
    }
    
    var leftScore = 0 {
        didSet {
            leftScoreLabel.text = String(leftScore)
        }
    }
    
    let cards = ["ace","card2","card3","card4","card5","card6","card7","card8",
                 "card9","card10","jack","queen","king"]
    
    @IBAction func dealTapped(_ sender: UIButton) {
        let leftCardValue = getRandomNumber()
        let rightCardValue = getRandomNumber()
        
        let leftCardName = cards[leftCardValue]
        let rightCardName = cards[rightCardValue]
        
        leftImageView.image = UIImage(named: leftCardName)!
        rightImageView.image = UIImage(named: rightCardName)!
        
        if leftCardValue > rightCardValue {
            leftScore += 1
        } else if leftCardValue < rightCardValue {
            rightScore += 1
        } else {
            // WAR!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getRandomNumber() -> Int {
        return Int(arc4random_uniform(UInt32(cards.count)))
    }


}

