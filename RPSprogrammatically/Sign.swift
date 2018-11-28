//
//  Sign.swift
//  RPSprogrammatically
//
//  Created by Mark Meretzky on 11/27/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import Foundation;
import GameplayKit;

enum Sign: Int {
    case rock;     //rock smashes scissors
    case paper;    //paper covers rock
    case scissors; //scissors cut paper
    
    //self is the user's choice, app is the app's choice
    
    func compareTo(_ app: Sign) -> GameState {
        if app == self {
            return .draw;
        }
        
        if (self.rawValue + 1) % 3 == app.rawValue {
            return .lose;   //user has lost, app has won
        }
        
        return .win;        //user has won, app has lost
    }
    
    //MARK: Type properties
    
    static let emojiArray: [String] = [
        "👊",   //rock
        "✋",   //paper
        "✌️"    //scissors
    ];
    
    //MARK: Computed properties
    
    var emoji: String {
        return Sign.emojiArray[rawValue];
    }
    

}

let randomChoice: GKRandomDistribution = GKRandomDistribution(lowestValue: 0, highestValue: 2);

//Return .rock, .paper, or .scissors
//See https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html#ID150

func randomSign() -> Sign {
    let i: Int = randomChoice.nextInt();   //0, 1, or 2
    return Sign(rawValue: i)!;
}
