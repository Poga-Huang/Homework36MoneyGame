//
//  ViewController.swift
//  Homework36MoneyGame
//
//  Created by 黃柏嘉 on 2021/12/8.
//

import UIKit

class ViewController: UIViewController {

    //view
    @IBOutlet weak var fruitBackView: UIView!
    @IBOutlet weak var AppleView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var bananaView: UIView!
    //Label
    @IBOutlet weak var AppleQtyLabel: UILabel!
    @IBOutlet weak var orangeQtyLabel: UILabel!
    @IBOutlet weak var bananaQtyLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var thousandLabel: UILabel!
    @IBOutlet weak var fiveHundredLabel: UILabel!
    @IBOutlet weak var hundredLabel: UILabel!
    @IBOutlet weak var fiftyLabel: UILabel!
    @IBOutlet weak var tenLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet var dollarLabelArray: [UILabel]!
    //stepper
    @IBOutlet weak var appleStepper: UIStepper!
    @IBOutlet weak var orangeStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var thousandStepper: UIStepper!
    @IBOutlet weak var fiveHundredStepper: UIStepper!
    @IBOutlet weak var hundredStepper: UIStepper!
    @IBOutlet weak var fiftyStepper: UIStepper!
    @IBOutlet weak var tenStepper: UIStepper!
    @IBOutlet weak var fiveStepper: UIStepper!
    @IBOutlet weak var oneStepper: UIStepper!
    //variable
    var appleCount = 0
    var orangeCount = 0
    var bananaCount = 0
    var thousandCount = 0
    var fiveHundredCount = 0
    var hundredCount = 0
    var fiftyCount = 0
    var tenCount = 0
    var fiveCount = 0
    var oneCount = 0
    var total = 0
    var payMoney = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitBackView.addSubview(AppleView)
    }
    
    //選擇水果
    @IBAction func selectFruit(_ sender: UISegmentedControl) {
        fruitBackView.subviews[0].removeFromSuperview()
        switch sender.selectedSegmentIndex{
        case 0:
            fruitBackView.addSubview(AppleView)
        case 1:
            fruitBackView.addSubview(orangeView)
        case 2:
            fruitBackView.addSubview(bananaView)
        default:
            return
        }
    }
    
    //變更水果數量
    @IBAction func changeFruitQuantity(_ sender: UIStepper){
        switch sender.tag{
        case 0 :
            appleCount = Int(sender.value)
            AppleQtyLabel.text = "Qty:\(appleCount)"
        case 1:
            orangeCount = Int(sender.value)
            orangeQtyLabel.text = "Qty:\(orangeCount)"
        case 2:
             bananaCount = Int(sender.value)
             bananaQtyLabel.text = "Qty:\(bananaCount)"
        default:
            return
        }
        calculateFruitPrice()
    }
    //計算水果價格
    func calculateFruitPrice(){
        total = (appleCount*24)+(orangeCount*14)+(bananaCount*19)
        totalLabel.text = "Total:$\(total)"
    }
    
    //變更錢的數量
    @IBAction func changeDollars(_ sender: UIStepper) {
        switch sender.tag{
        case 3:
            thousandCount = Int(sender.value)
            thousandLabel.text = "x\(thousandCount)"
        case 4:
            fiveHundredCount = Int(sender.value)
            fiveHundredLabel.text = "x\(fiveHundredCount)"
        case 5:
            hundredCount = Int(sender.value)
            hundredLabel.text = "x\(hundredCount)"
        case 6:
            fiftyCount = Int(sender.value)
            fiftyLabel.text = "x\(fiftyCount)"
        case 7:
            tenCount = Int(sender.value)
            tenLabel.text = "x\(tenCount)"
        case 8:
            fiveCount = Int(sender.value)
            fiveLabel.text = "x\(fiveCount)"
        case 9:
            oneCount = Int(sender.value)
            oneLabel.text = "x\(oneCount)"
        default:
            return
        }
        calculatePayMoney()
    }
    //計算總共按了多少錢
    func calculatePayMoney(){
        payMoney = (thousandCount*1000)+(fiveHundredCount*500)+(hundredCount*100)+(fiftyCount*50)+(tenCount*10)+(fiveCount*5)+(oneCount*1)
    }
    //交易
    @IBAction func payMoney(_ sender: UIButton) {
        if payMoney == total{
            //交易成功，清空
            restart()
            alert(title: "太棒了!!!", message: "給的錢剛剛好喔")
        }else if payMoney < total{
            //錢不夠，還差多少
            alert(title: "挖～～～", message: "給的錢不夠喔,還差\(total-payMoney)元")
        }else if payMoney > total{
            //錢太多，要多多少
            alert(title: "哇!!!", message: "給太多了，多出了\(payMoney-total)元")
        }
    }
    //重新
    func restart(){
        AppleQtyLabel.text = "Qty:0"
        orangeQtyLabel.text = "Qty:0"
        bananaQtyLabel.text = "Qty:0"
        totalLabel.text = "Total:$0"
        appleCount = 0
        orangeCount = 0
        bananaCount = 0
        thousandCount = 0
        fiveHundredCount = 0
        hundredCount = 0
        fiftyCount = 0
        tenCount = 0
        fiveCount = 0
        oneCount = 0
        appleStepper.value = 0
        orangeStepper.value = 0
        bananaStepper.value = 0
        thousandStepper.value = 0
        fiveHundredStepper.value = 0
        hundredStepper.value = 0
        fiftyStepper.value = 0
        tenStepper.value = 0
        fiveStepper.value = 0
        oneStepper.value = 0
        for i in dollarLabelArray{
            i.text = "x0"
        }
    }
    //清空畫面
    @IBAction func clearAll(_ sender: UIButton) {
        restart()
    }

    //警示器
    func alert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { okAction in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

}

