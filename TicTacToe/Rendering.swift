//
//  Rendering.swift
//  TicTacToe
//
//  Created by Joao Lopes on 04/09/2014.
//  Copyright (c) 2014 Joao Lopes. All rights reserved.
//

import UIKit

class Rendering{
    let globals: AppGlobals = AppGlobals.sharedInstance
    let imageStatesImage: Array<UIImage> = [UIImage(named: "x"), UIImage(named: "o")]
    let imageStatesColors: Array<UIColor> = [
        UIColor(red:0.29, green: 0.39, blue: 0.25, alpha: 0.7),
        UIColor(red:0.894, green: 0.76, blue: 0.54, alpha: 1)
    ]
    let btnDefaultColor: UIColor = UIColor(red: 0.4588, green: 0.604, blue: 0.99, alpha: 1)
    
    
    func animateButtonBackground(btn: UIButton, fromColor: CGColor, toColor: CGColor) {
        let colorAnim: CABasicAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnim.duration = 0.3
        colorAnim.fillMode = kCAFillModeForwards
        colorAnim.removedOnCompletion = false
        colorAnim.fromValue = fromColor
        colorAnim.toValue = toColor
        colorAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        btn.layer.addAnimation(colorAnim, forKey: "backgroundColor")
    }
    
    
    func animateButtonAlpha(btn: UIButton, fromValue: CGFloat, toValue: CGFloat) {
        let anim: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        anim.duration = 0.3
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.fromValue = fromValue
        anim.toValue = toValue
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        btn.layer.addAnimation(anim, forKey: "fadeInOut")
    }

    
    func renderGame() {
        let gameState = globals.gameState
        for var i = 0; i < gameState.count; i++ {
            let state = gameState[i]
            let button:UIButton = globals.ticTacButtons[i]
            var img:UIImage! = nil
            var color: UIColor = btnDefaultColor
            let actualColor: UIColor = button.backgroundColor!
            button.userInteractionEnabled = true
            
            if state > 0 {
                img = imageStatesImage[state - 1]
                color = imageStatesColors[state - 1]
                button.userInteractionEnabled = false
            }
            animateButtonBackground(button, fromColor: actualColor.CGColor, toColor: color.CGColor)
            button.backgroundColor = color
            button.setImage(img, forState: UIControlState.Normal)
        }
    }
}