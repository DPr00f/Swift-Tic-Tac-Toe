//
//  ViewController.swift
//  TicTacToe
//
//  Created by Joao Lopes on 04/09/2014.
//  Copyright (c) 2014 Joao Lopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var renderEngine: Rendering = Rendering()
    var game: Game = Game()
    let globals: AppGlobals = AppGlobals.sharedInstance
    var computer: ComputerLogic = ComputerLogic()
    
    @IBOutlet var toeBtn1: UIButton!
    @IBOutlet var toeBtn2: UIButton!
    @IBOutlet var toeBtn3: UIButton!
    @IBOutlet var toeBtn4: UIButton!
    @IBOutlet var toeBtn5: UIButton!
    @IBOutlet var toeBtn6: UIButton!
    @IBOutlet var toeBtn7: UIButton!
    @IBOutlet var toeBtn8: UIButton!
    @IBOutlet var toeBtn9: UIButton!
    @IBOutlet var resetBtn: UIButton!
    @IBOutlet var winLabel: UILabel!
   
    
    @IBAction func segmentedClicked(sender: UISegmentedControl) {
        globals.versusComputer = sender.selectedSegmentIndex  == 0 ? false : true
        winLabel.hidden = true
        resetBtn.hidden = true
        game.reset()
    }
    
    
    @IBAction func playAgainBtnClicked(sender: UIButton) {
        
        winLabel.hidden = true
        resetBtn.hidden = true
        game.reset()
    }
    
    
    @IBAction func btnToeClicked(sender: UIButton) {
        if computer.doingMove {
            return
        }
        game.setPlay(sender.tag)
        if globals.versusComputer {
            if !executeMove(){
                computer.doMove()
                executeMove()
            }
        }else{
            globals.changePlayer()
            executeMove()
        }
    }
    
    func executeMove() -> Bool{
        var ended = false
        renderEngine.renderGame()
        if let won = game.win() {
            winLabel.text = "Player \(won.playerNumber) won!"
            if won.playerNumber == 2 && globals.versusComputer {
                winLabel.text = "Computer won!"
            }
            game.gameover(won.relatedButtons)
            winLabel.hidden = false
            resetBtn.hidden = false
            ended = true
        }
        if game.tie() {
            winLabel.text = "Tie!"
            game.gameover([])
            winLabel.hidden = false
            resetBtn.hidden = false
            ended = true
        }
        return ended
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBtn.layer.borderColor = renderEngine.btnDefaultColor.CGColor
        globals.ticTacButtons = [
            toeBtn1, toeBtn2, toeBtn3,
            toeBtn4, toeBtn5, toeBtn6,
            toeBtn7, toeBtn8, toeBtn9
        ]
        
        renderEngine.renderGame()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

