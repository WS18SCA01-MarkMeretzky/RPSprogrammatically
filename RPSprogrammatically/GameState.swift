//
//  GameState.swift
//  RPSprogrammatically
//
//  Created by Mark Meretzky on 11/27/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

enum GameState: Int {
    case start;
    case win;   //user wins
    case lose;  //user loses
    case draw;
    
    //MARK: Type properties
    
    static let colorArray: [UIColor] = [
        .white,                   //.start
        .green,                   //.win
        .red,                     //.lose
        .gray                     //draw
    ];
    
    static let textArray: [String] = [
        "Rock, Paper, Scissors?", //.start
        "You won!",               //.win
        "You lost.",              //.lose
        "Draw"                    //.draw
    ];
    
    //MARK: Computed properties
    
    var color: UIColor {
        return GameState.colorArray[self.rawValue];
    }
    
    var text: String {
        return GameState.textArray[self.rawValue];
    }
}
