//
//  TraditionMiddleGame.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/10.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit

class TraditionMiddleGame:UIViewController{
    let countdown = CHWButton(count: 3, frame: cgrect, color:#colorLiteral(red: 0.4120420814, green: 0.8022739887, blue: 0.9693969488, alpha: 1))
    var BrickSelect = [[Int]](repeating:[Int](repeating:0,count:5),count:5)
    var Round_Time:Int = 0
    
    @IBOutlet weak var Title_Score: UILabel!
    @IBOutlet weak var TargetOne: UIButton!
    @IBOutlet weak var M11: UIButton!
    @IBOutlet weak var M12: UIButton!
    @IBOutlet weak var M13: UIButton!
    @IBOutlet weak var M14: UIButton!
    @IBOutlet weak var M15: UIButton!
    @IBOutlet weak var M21: UIButton!
    @IBOutlet weak var M22: UIButton!
    @IBOutlet weak var M23: UIButton!
    @IBOutlet weak var M24: UIButton!
    @IBOutlet weak var M25: UIButton!
    @IBOutlet weak var M31: UIButton!
    @IBOutlet weak var M32: UIButton!
    @IBOutlet weak var M33: UIButton!
    @IBOutlet weak var M34: UIButton!
    @IBOutlet weak var M35: UIButton!
    @IBOutlet weak var M41: UIButton!
    @IBOutlet weak var M42: UIButton!
    @IBOutlet weak var M43: UIButton!
    @IBOutlet weak var M44: UIButton!
    @IBOutlet weak var M45: UIButton!
    @IBOutlet weak var M51: UIButton!
    @IBOutlet weak var M52: UIButton!
    @IBOutlet weak var M53: UIButton!
    @IBOutlet weak var M54: UIButton!
    @IBOutlet weak var M55: UIButton!
    
    
    
    
    @IBAction func Quit(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func viewdestruct(OKAction:UIAlertAction) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var BrickSelected = 0
    func roundaddone(){
        self.Title_Score.text = "Round:" + String(Round_Time+1) + "/15"
    }
    
    func GameInitStep1(){
        
        self.BrickSelected = 0
        Round_Time = Round_Time + 1
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15],
            [self.M21,self.M22,self.M23,self.M24,self.M25],
            [self.M31,self.M32,self.M33,self.M34,self.M35],
            [self.M41,self.M42,self.M43,self.M44,self.M45],
            [self.M51,self.M52,self.M53,self.M54,self.M55]
        ]
        for i in 0..<5 {
            for j in 0..<5{
                BrickSelect[i][j] = 0
                (Buttons[i][j]! as UIButton).isEnabled = false
            }
        }
        let BrickNum = Round_Time + 2
        var Brick_Already_Select  = 0
        while(Brick_Already_Select != BrickNum){
            let row = Int(arc4random()%5)
            let col = Int(arc4random()%5)
            if(BrickSelect[row][col] == 1){
                continue
            }
            else{
                Brick_Already_Select = Brick_Already_Select + 1
                BrickSelect[row][col] = 1
                (Buttons[row][col]! as UIButton).backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            }
        }
        var timer2:Timer
        timer2 = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(TraditionEasyGame.GameInitStep2), userInfo: nil, repeats: false)
        //timer.invalidate()
        
    }
    func GameInitStep2(){
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15],
            [self.M21,self.M22,self.M23,self.M24,self.M25],
            [self.M31,self.M32,self.M33,self.M34,self.M35],
            [self.M41,self.M42,self.M43,self.M44,self.M45],
            [self.M51,self.M52,self.M53,self.M54,self.M55]
        ]
        for i in 0..<5{
            for j in 0..<5{
                (Buttons[i][j]! as UIButton).backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            }
        }
        for i in 0..<5 {
            for j in 0..<5{
                (Buttons[i][j]! as UIButton).isEnabled = true
            }
        }
        self.countdown.isHidden = true
    }
    func isRightClick(row:Int,col:Int) -> Bool{
        if(BrickSelect[row][col] == 1){
            return true
        }
        else{
            return false
        }
    }
    func allclear(OKAction:UIAlertAction){
        
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15],
            [self.M21,self.M22,self.M23,self.M24,self.M25],
            [self.M31,self.M32,self.M33,self.M34,self.M35],
            [self.M41,self.M42,self.M43,self.M44,self.M45],
            [self.M51,self.M52,self.M53,self.M54,self.M55]
        ]
        for i in 0..<5{
            for j in 0..<5{
                (Buttons[i][j]! as UIButton).backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            }
        }
        
    }
    
    @IBAction func Press_M11(_ sender: AnyObject) {
        if(BrickSelect[0][0] == 0){
            self.M11.isEnabled = false
            self.M11.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M11.isEnabled = false
            self.M11.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }

    
    
    @IBAction func Press_M12(_ sender: AnyObject) {
        if(BrickSelect[0][1] == 0){
            self.M12.isEnabled = false
            self.M12.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M12.isEnabled = false
            self.M12.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    

    
    @IBAction func Press_M13(_ sender: AnyObject) {
        if(BrickSelect[0][2] == 0){
            self.M13.isEnabled = false
            self.M13.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M13.isEnabled = false
            self.M13.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M14(_ sender: AnyObject) {
        if(BrickSelect[0][3] == 0){
            self.M14.isEnabled = false
            self.M14.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M14.isEnabled = false
            self.M14.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M15(_ sender: AnyObject) {
        if(BrickSelect[0][4] == 0){
            self.M15.isEnabled = false
            self.M15.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M15.isEnabled = false
            self.M15.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M21(_ sender: AnyObject) {
        if(BrickSelect[1][0] == 0){
            self.M21.isEnabled = false
            self.M21.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M21.isEnabled = false
            self.M21.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M22(_ sender: AnyObject) {
        if(BrickSelect[1][1] == 0){
            self.M22.isEnabled = false
            self.M22.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M22.isEnabled = false
            self.M22.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M23(_ sender: AnyObject) {
        if(BrickSelect[1][2] == 0){
            self.M23.isEnabled = false
            self.M23.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M23.isEnabled = false
            self.M23.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M24(_ sender: AnyObject) {
        if(BrickSelect[1][3] == 0){
            self.M24.isEnabled = false
            self.M24.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M24.isEnabled = false
            self.M24.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M25(_ sender: AnyObject) {
        if(BrickSelect[1][4] == 0){
            self.M25.isEnabled = false
            self.M25.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M25.isEnabled = false
            self.M25.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M31(_ sender: AnyObject) {
        if(BrickSelect[2][0] == 0){
            self.M31.isEnabled = false
            self.M31.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M31.isEnabled = false
            self.M31.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M32(_ sender: AnyObject) {
        if(BrickSelect[2][1] == 0){
            self.M32.isEnabled = false
            self.M32.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M32.isEnabled = false
            self.M32.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M33(_ sender: AnyObject) {
        if(BrickSelect[2][2] == 0){
            self.M33.isEnabled = false
            self.M33.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M33.isEnabled = false
            self.M33.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M34(_ sender: AnyObject) {
        if(BrickSelect[2][3] == 0){
            self.M34.isEnabled = false
            self.M34.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M34.isEnabled = false
            self.M34.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M35(_ sender: AnyObject) {
        if(BrickSelect[2][4] == 0){
            self.M35.isEnabled = false
            self.M35.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M35.isEnabled = false
            self.M35.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M41(_ sender: AnyObject) {
        if(BrickSelect[3][0] == 0){
            self.M41.isEnabled = false
            self.M41.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M41.isEnabled = false
            self.M41.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M42(_ sender: AnyObject) {
        if(BrickSelect[3][1] == 0){
            self.M42.isEnabled = false
            self.M42.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M42.isEnabled = false
            self.M42.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M43(_ sender: AnyObject) {
        if(BrickSelect[3][2] == 0){
            self.M43.isEnabled = false
            self.M43.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M43.isEnabled = false
            self.M43.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func Press_M44(_ sender: AnyObject) {
        if(BrickSelect[3][3] == 0){
            self.M44.isEnabled = false
            self.M44.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M44.isEnabled = false
            self.M44.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M45(_ sender: AnyObject) {
        if(BrickSelect[3][4] == 0){
            self.M45.isEnabled = false
            self.M45.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M45.isEnabled = false
            self.M45.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M51(_ sender: AnyObject) {
        if(BrickSelect[4][0] == 0){
            self.M51.isEnabled = false
            self.M51.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M51.isEnabled = false
            self.M51.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M52(_ sender: AnyObject) {
        if(BrickSelect[4][1] == 0){
            self.M52.isEnabled = false
            self.M52.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M52.isEnabled = false
            self.M52.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M53(_ sender: AnyObject) {
        if(BrickSelect[4][2] == 0){
            self.M53.isEnabled = false
            self.M53.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M53.isEnabled = false
            self.M53.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M54(_ sender: AnyObject) {
        if(BrickSelect[4][3] == 0){
            self.M54.isEnabled = false
            self.M54.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M54.isEnabled = false
            self.M54.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Press_M55(_ sender: AnyObject) {
        if(BrickSelect[4][4] == 0){
            self.M55.isEnabled = false
            self.M55.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailedAlert = UIAlertController(title: "What a Pity!", message: "You Lose", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailedAlert.addAction(OKAction)
            self.present(FailedAlert, animated: true, completion: nil)
        }
        else{
            self.M55.isEnabled = false
            self.M55.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.BrickSelected = self.BrickSelected + 1
            if(self.BrickSelected == Round_Time + 2){
                if(Round_Time != 15){
                    let SuccessAlert = UIAlertController(title: "Great", message: "Prepare for next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: allclear)
                    SuccessAlert.addAction(OKAction2)
                    self.present(SuccessAlert, animated: true, completion: nil)
                    self.countdown.isHidden = false
                }
                else{
                    let FinishAlert = UIAlertController(title: "Congratulation!", message: "You have finished All Challenge", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    FinishAlert.addAction(OKAction)
                    self.present(FinishAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15],
            [self.M21,self.M22,self.M23,self.M24,self.M25],
            [self.M31,self.M32,self.M33,self.M34,self.M35],
            [self.M41,self.M42,self.M43,self.M44,self.M45],
            [self.M51,self.M52,self.M53,self.M54,self.M55]
        ]
        for i in 0..<5{
            for j in 0..<5{
                (Buttons[i][j]! as UIButton).layer.cornerRadius = 20
                (Buttons[i][j]! as UIButton).layer.masksToBounds = true
            }
        }
        self.TargetOne.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
        self.TargetOne.layer.cornerRadius = 15
        self.TargetOne.isEnabled = false
        self.Title_Score.text = "Round:0/15"
        countdown.layer.cornerRadius = 20
        countdown.layer.masksToBounds = true
        self.view.addSubview(countdown)
        countdown.addTarget(self, action: #selector(TraditionEasyGame.roundaddone), for: UIControlEvents.touchUpInside)
        countdown.addTarget(self, action: #selector(TraditionEasyGame.GameInitStep1), for: UIControlEvents.touchUpInside)
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
