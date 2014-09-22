//
//  WinMasks.swift
//  TicTacToe
//
//  Created by Joao Lopes on 04/09/2014.
//  Copyright (c) 2014 Joao Lopes. All rights reserved.
//

struct Masks  {
    
    static var win = [
        "topHorz": [
            1,1,1,
            0,0,0,
            0,0,0
        ],
        "midHorz": [
            0,0,0,
            1,1,1,
            0,0,0
        ],
        "bottomHorz": [
            0,0,0,
            0,0,0,
            1,1,1
        ],
        "leftVert": [
            1,0,0,
            1,0,0,
            1,0,0
        ],
        "midVert": [
            0,1,0,
            0,1,0,
            0,1,0
        ],
        "rightVert": [
            0,0,1,
            0,0,1,
            0,0,1
        ],
        "leftDiag": [
            1,0,0,
            0,1,0,
            0,0,1
        ],
        "rightDiag": [
            0,0,1,
            0,1,0,
            1,0,0
        ]
    ]
    
    static var checkForTwoPatterns = ["202", "220", "022", "110", "011", "101"]
    
}