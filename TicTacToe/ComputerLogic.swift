//
//  ComputerLogic.swift
//  TicTacToe
//
//  Created by Joao Lopes on 04/09/2014.
//  Copyright (c) 2014 Joao Lopes. All rights reserved.
//

import Foundation

class ComputerLogic{
    let globals = AppGlobals.sharedInstance
    var game: Game
    var doingMove : Bool = false
    
    
    required init(){
        self.game = Game()
    }
    
    
    func doMove(){
        doingMove = true
        if let doubleCheck = checkForTwo() {
            game.setPlay(doubleCheck, value: 2)
        }else if game.tileAvailable(4) { // Check center tile
            game.setPlay(4, value: 2)
        }else if let cornerAvailable = firstAvailable(true) { // Check Available corner
            game.setPlay(cornerAvailable, value: 2)
        }else if let sideAvailable = firstAvailable(false) { // Check Available side
            game.setPlay(sideAvailable, value: 2)
        }
        
        doingMove = false
    }
    
    
    func firstAvailable(isCorner: Bool) -> Int?{
        var spots = isCorner ? [0,2,6,8] : [1,3,5,7]
        for spot in spots {
            if game.tileAvailable(spot){
                return spot
            }
        }
        return nil
    }
    
    
    func checkBottom() -> (pattern: String, locations: Array<Int>){
        var locals = [6,7,8]
        return (getPattern(locals), locals)
    }
    
    
    func checkTop() -> (pattern: String, locations: Array<Int>){
        var locals = [0,1,2]
        return (getPattern(locals), locals)
    }
    
    
    func checkRight() -> (pattern: String, locations: Array<Int>){
        var locals = [2,5,8]
        return (getPattern(locals), locals)
    }
    
    
    func checkLeft() -> (pattern: String, locations: Array<Int>){
        var locals = [0,3,6]
        return (getPattern(locals), locals)
    }
    
    
    func checkMiddleAcross() -> (pattern: String, locations: Array<Int>){
        var locals = [3,4,5]
        return (getPattern(locals), locals)
    }
    
    
    func checkMiddleDown() -> (pattern: String, locations: Array<Int>){
        var locals = [1,4,7]
        return (getPattern(locals), locals)
    }
    
    
    func checkDiagRight() -> (pattern: String, locations: Array<Int>){
        var locals = [2,4,6]
        return (getPattern(locals), locals)
    }
    
    
    func checkDiagLeft() -> (pattern: String, locations: Array<Int>){
        var locals = [0,4,8]
        return (getPattern(locals), locals)
    }
    
    
    func getPattern(inList: Array<Int>) -> String{
        let gS = game.getGameState()
        return "\(gS[inList[0]])\(gS[inList[1]])\(gS[inList[2]])"
    }
    
    func checkForTwo() -> Int? {
        let patterns = Masks.checkForTwoPatterns
        let funcs = [checkTop, checkBottom, checkRight, checkLeft, checkMiddleAcross, checkMiddleDown, checkDiagRight, checkDiagLeft]
        for algo in funcs{
            var algResults = algo()
            if find(patterns, algResults.pattern) != nil {
                var location: Int = algResults.locations[0]
                if game.tileAvailable(algResults.locations[1]) {
                    location = algResults.locations[1]
                }else if game.tileAvailable(algResults.locations[2]) {
                    location = algResults.locations[2]
                }
                return location
            }
        }
        return nil
    }
}