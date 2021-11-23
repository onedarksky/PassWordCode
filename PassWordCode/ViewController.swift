//
//  ViewController.swift
//  PassWordCode
//
//  Created by Jiang Yung Tse on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var NumberButton: [UIButton]!
    
    @IBOutlet var PassWordImageView: [UIImageView]!
    
    var passWord = "0000"
    var enterPassCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //判斷密碼輸入到第幾個，並顯示圖片
    func imageChangeView (){
        switch enterPassCode.count {
        case 1:
            for i in 0...3{
                PassWordImageView[i].isHighlighted = true
                if i > 0 {
                    PassWordImageView[i].isHighlighted = false
                }
            }
        case 2:
            for i in 0...3 {
                PassWordImageView[i].isHighlighted = true
                if i > 1 {
                    PassWordImageView[i].isHighlighted = false
                }
            }
        case 3: for i in 0...3 {
            PassWordImageView[i].isHighlighted = true
            if i > 2 {
                PassWordImageView[i].isHighlighted = false
            }
        }
        case 4:
            for i in PassWordImageView {
                i.isHighlighted = true
            }
            checkPassWord()
        default:
            for i in PassWordImageView{
                i.isHighlighted = false
            }
      }
}
    //彈出視窗、判斷數字是否正確
    func checkPassWord(){
        if enterPassCode == passWord {
            let controller = UIAlertController(title: "Corret", message: "Welcome Back!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
                self.reset()
            }
            controller.addAction(action)
            present(controller,animated: true,completion: nil)
        }else{
            let controller = UIAlertController(title: "Wrong", message: "Please Try Again!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            controller.addAction(action)
            present(controller, animated: true, completion: reset)
        }
    }
    //歸零重新
    func reset () {
        for i in PassWordImageView {
            i.isHighlighted = false
        }
        enterPassCode = ""
    }
    
    @IBAction func enterPassWordNumber(_ sender: UIButton) {
        if enterPassCode.count != 4 {
            if let inputNumber = sender.currentTitle {
                enterPassCode.append(inputNumber)
            }
        }
        imageChangeView()
    }
    
    // 刪除前一數字鍵
    @IBAction func backWard(_ sender: UIButton) {
        if enterPassCode.count != 0 {
            enterPassCode = String(enterPassCode.dropLast(1))
            imageChangeView()
        }
    }
}
