//
//  Game.swift
//  TicTacToe
//
//  Created by Joao Lopes on 04/09/2014.
//  Copyright (c) 2014 Joao Lopes. All rights reserved.
//

import Foundation
import UIKit


class Game {
    var renderEngine: Rendering
    var globals: AppGlobals
    
    
    required init(){
        renderEngine = Rendering()
        self.globals = AppGlobals.sharedInstance
    }
    
    
    func setPlay(position: Int){
        setPlay(position, value: nil)
    }
    
    
    func setPlay(position: Int, value: Int?){
        if value != nil{
            globals.gameState[position] = value!
        }else{
            globals.gameState[position] = globals.playerValues[globals.playerState]
        }
    }
    
    
    func getGameState() -> Array<Int> {
        return globals.gameState
    }

    
    func reset(){
        for btn in globals.ticTacButtons {
            btn.enabled = true
            renderEngine.animateButtonAlpha(btn, fromValue: btn.alpha, toValue: 1)
        }
        globals.playerState = 0
        globals.gameState = [
            0, 0, 0,
            0, 0, 0,
            0, 0, 0
        ]
        renderEngine.renderGame()
    }
    
    
    func tie() -> Bool {
        let gameState = getGameState()
        for var i = 0; i < gameState.count; i++ {
            if gameState[i] == 0 {
                return false
            }
        }
        return true
    }
    
    
    func gameover(highlightBtns: Array<UIButton>){
        for btn in globals.ticTacButtons {
            btn.userInteractionEnabled = false
            renderEngine.animateButtonAlpha(btn, fromValue: 1, toValue: 0.5)
        }
        for btn in highlightBtns {
            btn.layer.removeAllAnimations()
            btn.alpha = 1
        }
    }
    
    
    func win() -> (winName: String, playerNumber: Int, relatedButtons: Array<UIButton>)?{
        let gameState = getGameState()
        let btns = globals.ticTacButtons
        var arr: Array<Int> = [0,0,0,0,0,0,0,0,0]
        var knownButtons: Array<UIButton> = [btns[0],btns[0],btns[0]]
        var cleaned:String = ""
        for (winName, winMask) in Masks.win{
            cleaned = ""
            for var i = 0, j = 0; i < winMask.count; i++ {
                let mask : Int = winMask[i]
                arr[i] = gameState[i] * mask
                if mask == 1 {
                    cleaned += "\(arr[i])"
                    knownButtons[j] = btns[i]
                    j++
                }
            }
            for playerValue in globals.playerValues {
                if cleaned == "\(playerValue)\(playerValue)\(playerValue)" {
                    return (winName, playerValue, knownButtons)
                }
            }
        }
        return nil
    }
    
    
    func tileAvailable(position: Int) -> Bool{
        return  getGameState()[position] == 0 ? true : false
    }
}