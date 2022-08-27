//
//  ViewController.swift
//  Renda
//
//  Created by ryo on 2022/08/15.
//

import UIKit
import Firebase

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
        
        // Firestoreのデータを読み込む
        firestore.collection("counts").document("share").getDocument { snapshot, error in
            if error != nil {
                print("エラーが発生しました")
                print(error)
                return
            }
            let data = snapshot?.data()
            if data == nil {
                print("データがありません")
                return
            }
            let count = data!["count"] as? Int
            if count == nil {
                print("countという対応する値がありません")
                return
            }
            self.tapCount = count!
            self.countLabel.text = String(count!)
        }
    }
    
    // FireStoreを使うときのプロパティ
    let firestore = Firestore.firestore()
    
    //TAPボタンが押されたときに
    @IBAction func tapTapButton(){
        
        tapCount += 1
        
        countLabel.text = String(tapCount)
        
        // FirestoreにtapCountを書き込む
        firestore.collection("counts").document("share").setData(["count": tapCount])
    }


}

