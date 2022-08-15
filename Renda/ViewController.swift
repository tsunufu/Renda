//
//  ViewController.swift
//  Renda
//
//  Created by ryo on 2022/08/15.
//

import UIKit

class ViewController: UIViewController {
    
    //タップ数表示のLabelの変数
    @IBOutlet var countLabel: UILabel!
    
    //タップボタンの変数
    @IBOutlet var tapButton: UIButton!
    
    //タップ数を数える変数
    var tapCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tapButton.layer.cornerRadius = 125
    }
    
    //TAPボタンが押されたときに
    @IBAction func tapTapButton(){
        
        tapCount += 1
        
        countLabel.text = String(tapCount)
    }


}

