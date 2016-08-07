//
//  TraditionEasyGame.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/9.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit
let cgrect = CGRect(x: 110, y: 170, width: 100, height: 60)
let cgrect2 = CGRect(x: 71, y: 477, width: 50, height: 50)
let targetlabel = UILabel(frame: cgrect2)
class TraditionEasyGame:UIViewController{
    let countdown = CHWButton(count: 3, frame: cgrect, color:#colorLiteral(red: 0.4120420814, green: 0.8022739887, blue: 0.9693969488, alpha: 1))
    var Game_Start_Flag : Int = 0
    var Round_Time:Int = 0
    var RoundNum:Int = 0
    var BrickSelect = [[Int]](repeating:[Int](repeating:0,count:4),count:4)
    @IBOutlet weak var Title_TargetOne: UILabel!
    @IBOutlet weak var Title_Score: UILabel!
    @IBOutlet weak var M11: UIButton!
    @IBOutlet weak var M12: UIButton!
    @IBOutlet weak var M13: UIButton!
    @IBOutlet weak var M14: UIButton!
    @IBOutlet weak var M21: UIButton!
    @IBOutlet weak var M22: UIButton!
    @IBOutlet weak var M23: UIButton!
    @IBOutlet weak var M24: UIButton!
    @IBOutlet weak var M31: UIButton!
    @IBOutlet weak var M32: UIButton!
    @IBOutlet weak var M33: UIButton!
    @IBOutlet weak var M34: UIButton!
    @IBOutlet weak var M41: UIButton!
    @IBOutlet weak var M42: UIButton!
    @IBOutlet weak var M43: UIButton!
    @IBOutlet weak var M44: UIButton!
    @IBOutlet weak var Start_Button: UIButton!

    
    
    @IBAction func Quit(_ sender: AnyObject) {
        self.dismiss(animated:true,completion: nil)
    }
    func viewdestruct(OKAction:UIAlertAction) {
        self.dismiss(animated: true, completion: nil)
    }

    
    var BrickSelected = 0
    
    
    
    func roundaddone(){
        //Round_Time = Round_Time + 1
       self.Title_Score.text = "Round:" + String(Round_Time+1) + "/10"
    }
    
    func GameInitStep1(){
        
        self.BrickSelected = 0
        Round_Time = Round_Time + 1
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14],
            [self.M21,self.M22,self.M23,self.M24],
            [self.M31,self.M32,self.M33,self.M34],
            [self.M41,self.M42,self.M43,self.M44]
        ]
        for i in 0..<4 {
            for j in 0..<4{
                BrickSelect[i][j] = 0
                (Buttons[i][j]! as UIButton).isEnabled = false
            }
        }
        let BrickNum = Round_Time
        var Brick_Already_Select  = 0
        while(Brick_Already_Select != BrickNum){
         let row = Int(arc4random()%4)
         let col = Int(arc4random()%4)
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
            [self.M11,self.M12,self.M13,self.M14],
            [self.M21,self.M22,self.M23,self.M24],
            [self.M31,self.M32,self.M33,self.M34],
            [self.M41,self.M42,self.M43,self.M44]
        ]
        for i in 0..<4{
            for j in 0..<4{
                (Buttons[i][j]! as UIButton).backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            }
        }
        for i in 0..<4 {
            for j in 0..<4{
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

    @IBOutlet weak var wahaha: UIButton!

    func allclear(OKAction:UIAlertAction){
        
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14],
            [self.M21,self.M22,self.M23,self.M24],
            [self.M31,self.M32,self.M33,self.M34],
            [self.M41,self.M42,self.M43,self.M44]
        ]
        for i in 0..<4{
            for j in 0..<4{
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
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
            if(self.BrickSelected == Round_Time){
                if(Round_Time != 10){
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
                    self.countdown.isHidden = false
                }
            }
        }

    }
    
    
    
    
    
    
    override func viewDidLoad() {
        
        self.Title_TargetOne.text = String("Target:")
        self.wahaha.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
        self.wahaha.layer.cornerRadius = 15
        self.wahaha.isEnabled = false
        
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14],
            [self.M21,self.M22,self.M23,self.M24],
            [self.M31,self.M32,self.M33,self.M34],
            [self.M41,self.M42,self.M43,self.M44]
        ]
        for i in 0..<4{
            for j in 0..<4{
                (Buttons[i][j]! as UIButton).layer.cornerRadius = 25
                (Buttons[i][j]! as UIButton).layer.masksToBounds = true
            }
        }
        self.Title_Score.text = "Round:0/10"

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
