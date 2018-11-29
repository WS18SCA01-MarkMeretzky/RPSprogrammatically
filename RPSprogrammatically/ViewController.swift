//
//  ViewController.swift
//  RPSprogrammatically
//
//  Created by Mark Meretzky on 11/27/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController: UIViewController {
    
    //MARK: UIViews
    
    let appSignLabel: UILabel = UILabel(); //robot head, then emoji of app's choice of Sign
    let statusLabel: UILabel = UILabel();  //"You win", "You lose", etc.
    
    let rockButton: UIButton = UIButton();
    let paperButton: UIButton = UIButton();
    let scissorsButton: UIButton = UIButton();
    
    let playAgainButton: UIButton = UIButton();
    
    //MARK: -

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        appSignLabel.font = .systemFont(ofSize: 72);
        appSignLabel.frame.size = appSignLabel.intrinsicContentSize;
        
        rockButton.setTitle("👊", for: .normal);
        rockButton.titleLabel!.font = .systemFont(ofSize: 72);
        rockButton.addTarget(self, action: #selector(rockButtonPressed), for: .touchUpInside);

        paperButton.setTitle("✋", for: .normal);
        paperButton.titleLabel!.font = .systemFont(ofSize: 72);
        paperButton.addTarget(self, action: #selector(paperButtonPressed), for: .touchUpInside);
        
        scissorsButton.setTitle("✌️", for: .normal);
        scissorsButton.titleLabel!.font = .systemFont(ofSize: 72);
        scissorsButton.addTarget(self, action: #selector(scissorsButtonPressed), for: .touchUpInside);
        
        //Put the three sign buttons into a horizontal stack view.
        
        let arrayOfButtons: [UIButton] = [
            rockButton,
            paperButton,
            scissorsButton
        ];
        
        let horizontalStackView: UIStackView = UIStackView(arrangedSubviews: arrayOfButtons);
        horizontalStackView.axis = .horizontal;
        horizontalStackView.distribution = .equalSpacing;
        horizontalStackView.spacing = 28;
        horizontalStackView.alignment = .center;
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        playAgainButton.setTitle("Play Again", for: .normal);
        let color: UIColor = UIColor(red: 21 / 255, green: 126 / 255, blue: 251 / 255, alpha: 1);
        playAgainButton.setTitleColor(color, for: .normal);
        playAgainButton.addTarget(self, action: #selector(playAgainButtonPressed), for: .touchUpInside);
        
        //Put the four views into a vertical stack view.
        
        let arrayOfViews: [UIView] = [
            appSignLabel,
            statusLabel,
            horizontalStackView,
            playAgainButton
        ];

        let verticalStackView: UIStackView = UIStackView(arrangedSubviews: arrayOfViews);
        verticalStackView.axis = .vertical;
        horizontalStackView.distribution = .equalSpacing;
        verticalStackView.spacing = 60;
        verticalStackView.alignment = .center;
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        //Center the vertical stack view in the view controller's big white view.
        //The first constraint keeps the X coordinate of the center of the vertical stack view
        //equal to the X coordinate of the center of the big white view.
        
        view.addSubview(verticalStackView);   //Must come before you create the constraints.
        
        let horizontalConstraint: NSLayoutConstraint = verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor);
        horizontalConstraint.isActive = true;

        let verticalConstraint: NSLayoutConstraint = verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor);
        verticalConstraint.isActive = true;
        
        updateUI(.start);
    }
    
    //Called by the three sign buttons.
    
    func play(_ userSign: Sign) {
        let appSign: Sign = randomSign();
        appSignLabel.text = appSign.emoji;
        let gameState: GameState = userSign.compareTo(appSign);
        updateUI(gameState);
        
        rockButton.isEnabled = false;
        paperButton.isEnabled = false;
        scissorsButton.isEnabled = false;
        
        if userSign != .rock {
            rockButton.isHidden = true;
        }
        if userSign != .paper {
            paperButton.isHidden = true;
        }
        if userSign != .scissors {
            scissorsButton.isHidden = true;
        }
        playAgainButton.isHidden = false;
    }
    
    //Called by viewDidLoad, play method, and play again button.
    
    func updateUI(_ gameState: GameState) {
        statusLabel.text = gameState.text;
        view.backgroundColor = gameState.color;
        
        if gameState == .start {
            appSignLabel.text = "🤖";
            playAgainButton.isHidden = true;
            rockButton.isEnabled = true;
            rockButton.isHidden = false;
            paperButton.isEnabled = true;
            paperButton.isHidden = false;
            scissorsButton.isEnabled = true;
            scissorsButton.isHidden = false;
        }
    }
    
    //MARK: Methods called by the buttons.
    
    @objc func rockButtonPressed(_ sender: UIButton) {
        play(.rock);
    }
    
    @objc func paperButtonPressed(_ sender: UIButton) {
        play(.paper);
    }
    
    @objc func scissorsButtonPressed(_ sender: UIButton) {
        play(.scissors);
    }
    
    @objc func playAgainButtonPressed(_ sender: UIButton) {
        updateUI(.start);
    }

}
