//
//  Globals.swift
//  TicTacToe
//
//  Created by Joao Lopes on 04/09/2014.
//  Copyright (c) 2014 Joao Lopes. All rights reserved.
//

import UIKit

class AppGlobals {
    class var sharedInstance : AppGlobals {
    struct Static {
        static let instance : AppGlobals = AppGlobals()
        }
        return Static.instance
    }
    var versusComputer: Bool = false
    var ticTacButtons: Array<UIButton> = []
    var gameState: Array<Int> = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var playerState: Int = 0
    var playerValues: Array<Int> = [1, 2]
    
    func changePlayer(){
        playerState = playerState == 0 ? 1 : 0
    }
}