//
//  SequenceEasy.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/11.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit
class SequenceHard:UIViewController{
    @IBOutlet weak var countdown: UIButton!
    var Round_Time:Int = 1
    var BrickSelect = [[Int]](repeating:[Int](repeating:0,count:6),count:6)
    var Brick_Already_Select : Int = 0
    @IBAction func Quit(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
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
    @IBOutlet weak var Title_Score: UILabel!
    @IBOutlet weak var M16: UIButton!
    @IBOutlet weak var M26: UIButton!
    @IBOutlet weak var M36: UIButton!
    @IBOutlet weak var M46: UIButton!
    @IBOutlet weak var M56: UIButton!
    @IBOutlet weak var M66: UIButton!
    @IBOutlet weak var M61: UIButton!
    @IBOutlet weak var M62: UIButton!
    @IBOutlet weak var M63: UIButton!
    @IBOutlet weak var M64: UIButton!
    @IBOutlet weak var M65: UIButton!

    func viewdestruct(OKAction:UIAlertAction) {
        self.dismiss(animated: true, completion: nil)
    }
    var timer10:Timer!
    func roundaddone(){
        disablekeyboard()
        self.Title_Score.text = "Round:" + String(Round_Time) + "/20"
    }
    var BrickNo:Int = 1
    var record_row:Int = 0
    var record_col:Int = 0
    func randomlyselectinSequence(){
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15,self.M16],
            [self.M21,self.M22,self.M23,self.M24,self.M25,self.M26],
            [self.M31,self.M32,self.M33,self.M34,self.M35,self.M36],
            [self.M41,self.M42,self.M43,self.M44,self.M45,self.M46],
            [self.M51,self.M52,self.M53,self.M54,self.M55,self.M56],
            [self.M61,self.M62,self.M63,self.M64,self.M65,self.M66],
        ]
        print(Brick_Already_Select)
        if(Brick_Already_Select == Round_Time + 4){
            (Buttons[record_row][record_col]! as UIButton).backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            (Buttons[record_row][record_col]! as UIButton).setTitle(nil, for: [])
            
            if(timer10.isValid){
                timer10.fireDate = NSDate.distantFuture()
            }
            GameON()
            return
        }
        allclear()
        var select_flag = 0
        while(select_flag == 0){
            let row = Int(arc4random()%6)
            let col = Int(arc4random()%6)
            if(BrickSelect[row][col] != 0){
                continue
            }
            else{
                record_row = row
                record_col = col
                BrickSelect[row][col] = BrickNo
                (Buttons[row][col]! as UIButton).backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
                (Buttons[row][col]! as UIButton).setTitle(String(BrickNo), for: [])
                (Buttons[row][col]! as UIButton).setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
                Brick_Already_Select = Brick_Already_Select + 1
                BrickNo = BrickNo + 1
                select_flag = 1
                return
            }
        }
    }
    func disablekeyboard(){
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15,self.M16],
            [self.M21,self.M22,self.M23,self.M24,self.M25,self.M26],
            [self.M31,self.M32,self.M33,self.M34,self.M35,self.M36],
            [self.M41,self.M42,self.M43,self.M44,self.M45,self.M46],
            [self.M51,self.M52,self.M53,self.M54,self.M55,self.M56],
            [self.M61,self.M62,self.M63,self.M64,self.M65,self.M66],
            ]
        for i in 0..<6 {
            for j in 0..<6{
                (Buttons[i][j] as UIButton!).isEnabled = false
            }
        }
    }
    func GameON(){
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15,self.M16],
            [self.M21,self.M22,self.M23,self.M24,self.M25,self.M26],
            [self.M31,self.M32,self.M33,self.M34,self.M35,self.M36],
            [self.M41,self.M42,self.M43,self.M44,self.M45,self.M46],
            [self.M51,self.M52,self.M53,self.M54,self.M55,self.M56],
            [self.M61,self.M62,self.M63,self.M64,self.M65,self.M66],
            ]
        self.countdown.isHidden = true
        self.countdown.isEnabled = false
        for i in 0..<6 {
            for j in 0..<6{
                (Buttons[i][j] as UIButton!).isEnabled = true
            }
        }
    }
    func GameInit(){
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15,self.M16],
            [self.M21,self.M22,self.M23,self.M24,self.M25,self.M26],
            [self.M31,self.M32,self.M33,self.M34,self.M35,self.M36],
            [self.M41,self.M42,self.M43,self.M44,self.M45,self.M46],
            [self.M51,self.M52,self.M53,self.M54,self.M55,self.M56],
            [self.M61,self.M62,self.M63,self.M64,self.M65,self.M66],
            ]
        for i in 0..<6 {
            for j in 0..<6{
                BrickSelect[i][j] = 0
                (Buttons[i][j] as UIButton!).isEnabled = false
            }
        }
        BrickNo = 1
        Brick_Already_Select = 0
        timer10 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SequenceEasy.randomlyselectinSequence), userInfo: nil, repeats: true)
        
        return
    }
    func allclear(){
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15,self.M16],
            [self.M21,self.M22,self.M23,self.M24,self.M25,self.M26],
            [self.M31,self.M32,self.M33,self.M34,self.M35,self.M36],
            [self.M41,self.M42,self.M43,self.M44,self.M45,self.M46],
            [self.M51,self.M52,self.M53,self.M54,self.M55,self.M56],
            [self.M61,self.M62,self.M63,self.M64,self.M65,self.M66],
            ]
        for i in 0..<6{
            for j in 0..<6{
                (Buttons[i][j]! as UIButton).backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
                (Buttons[i][j]! as UIButton).setTitle(nil, for: [])
            }
        }
        
    }
    func allclear(OKAction:UIAlertAction){
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15,self.M16],
            [self.M21,self.M22,self.M23,self.M24,self.M25,self.M26],
            [self.M31,self.M32,self.M33,self.M34,self.M35,self.M36],
            [self.M41,self.M42,self.M43,self.M44,self.M45,self.M46],
            [self.M51,self.M52,self.M53,self.M54,self.M55,self.M56],
            [self.M61,self.M62,self.M63,self.M64,self.M65,self.M66],
            ]
        for i in 0..<6{
            for j in 0..<6{
                (Buttons[i][j]! as UIButton).backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            }
        }
    }
    
    var BrickSelectedNo = 1
    var BrickSuccessfullySelect = 0
    
    @IBAction func Press_M11(_ sender: AnyObject) {
        if(BrickSelect[0][0] != BrickSelectedNo){
            self.M11.isEnabled = false
            self.M11.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M11.isEnabled = false
            self.M11.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M11.setTitle(String(BrickSelectedNo), for: [])
            self.M11.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    
    
    @IBAction func Press_M12(_ sender: AnyObject) {
        if(BrickSelect[0][1] != BrickSelectedNo){
            self.M12.isEnabled = false
            self.M12.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M12.isEnabled = false
            self.M12.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M12.setTitle(String(BrickSelectedNo), for: [])
            self.M12.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    
    
    @IBAction func Press_M13(_ sender: AnyObject) {
        if(BrickSelect[0][2] != BrickSelectedNo){
            self.M13.isEnabled = false
            self.M13.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M13.isEnabled = false
            self.M13.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M13.setTitle(String(BrickSelectedNo), for: [])
            self.M13.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    
    @IBAction func Press_M14(_ sender: AnyObject) {
        if(BrickSelect[0][3] != BrickSelectedNo){
            self.M14.isEnabled = false
            self.M14.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M14.isEnabled = false
            self.M14.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M14.setTitle(String(BrickSelectedNo), for: [])
            self.M14.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    
    @IBAction func Press_M21(_ sender: AnyObject) {
        if(BrickSelect[1][0] != BrickSelectedNo){
            self.M21.isEnabled = false
            self.M21.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M21.isEnabled = false
            self.M21.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M21.setTitle(String(BrickSelectedNo), for: [])
            self.M21.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    
    @IBAction func Press_M22(_ sender: AnyObject) {
        if(BrickSelect[1][1] != BrickSelectedNo){
            self.M22.isEnabled = false
            self.M22.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M22.isEnabled = false
            self.M22.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M22.setTitle(String(BrickSelectedNo), for: [])
            self.M22.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    
    @IBAction func Press_M23(_ sender: AnyObject) {
        if(BrickSelect[1][2] != BrickSelectedNo){
            self.M23.isEnabled = false
            self.M23.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M23.isEnabled = false
            self.M23.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M23.setTitle(String(BrickSelectedNo), for: [])
            self.M23.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func Press_M24(_ sender: AnyObject) {
        if(BrickSelect[1][3] != BrickSelectedNo){
            self.M24.isEnabled = false
            self.M24.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M24.isEnabled = false
            self.M24.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M24.setTitle(String(BrickSelectedNo), for: [])
            self.M24.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func Press_M31(_ sender: AnyObject) {
        if(BrickSelect[2][0] != BrickSelectedNo){
            self.M31.isEnabled = false
            self.M31.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M31.isEnabled = false
            self.M31.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M31.setTitle(String(BrickSelectedNo), for: [])
            self.M31.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func Press_M32(_ sender: AnyObject) {
        if(BrickSelect[2][1] != BrickSelectedNo){
            self.M32.isEnabled = false
            self.M32.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M32.isEnabled = false
            self.M32.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M32.setTitle(String(BrickSelectedNo), for: [])
            self.M32.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func Press_M33(_ sender: AnyObject) {
        if(BrickSelect[2][2] != BrickSelectedNo){
            self.M33.isEnabled = false
            self.M33.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M33.isEnabled = false
            self.M33.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M33.setTitle(String(BrickSelectedNo), for: [])
            self.M33.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func Press_M34(_ sender: AnyObject) {
        if(BrickSelect[2][3] != BrickSelectedNo){
            self.M34.isEnabled = false
            self.M34.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M34.isEnabled = false
            self.M34.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M34.setTitle(String(BrickSelectedNo), for: [])
            self.M34.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func Press_M41(_ sender: AnyObject) {
        if(BrickSelect[3][0] != BrickSelectedNo){
            self.M41.isEnabled = false
            self.M41.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M41.isEnabled = false
            self.M41.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M41.setTitle(String(BrickSelectedNo), for: [])
            self.M41.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func Press_M42(_ sender: AnyObject) {
        if(BrickSelect[3][1] != BrickSelectedNo){
            self.M42.isEnabled = false
            self.M42.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M42.isEnabled = false
            self.M42.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M42.setTitle(String(BrickSelectedNo), for: [])
            self.M42.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    @IBAction func Press_M43(_ sender: AnyObject) {
        if(BrickSelect[3][2] != BrickSelectedNo){
            self.M43.isEnabled = false
            self.M43.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M43.isEnabled = false
            self.M43.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M43.setTitle(String(BrickSelectedNo), for: [])
            self.M43.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func Press_M44(_ sender: AnyObject) {
        if(BrickSelect[3][3] != BrickSelectedNo){
            self.M44.isEnabled = false
            self.M44.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M44.isEnabled = false
            self.M44.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M44.setTitle(String(BrickSelectedNo), for: [])
            self.M44.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    
    
    
    
    @IBAction func Press_M15(_ sender: AnyObject) {
        if(BrickSelect[0][4] != BrickSelectedNo){
            self.M15.isEnabled = false
            self.M15.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M15.isEnabled = false
            self.M15.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M15.setTitle(String(BrickSelectedNo), for: [])
            self.M15.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    @IBAction func Press_M25(_ sender: AnyObject) {
        if(BrickSelect[1][4] != BrickSelectedNo){
            self.M25.isEnabled = false
            self.M25.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M25.isEnabled = false
            self.M25.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M25.setTitle(String(BrickSelectedNo), for: [])
            self.M25.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M35(_ sender: AnyObject) {
        if(BrickSelect[2][4] != BrickSelectedNo){
            self.M35.isEnabled = false
            self.M35.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M35.isEnabled = false
            self.M35.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M35.setTitle(String(BrickSelectedNo), for: [])
            self.M35.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M45(_ sender: AnyObject) {
        if(BrickSelect[3][4] != BrickSelectedNo){
            self.M45.isEnabled = false
            self.M45.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M45.isEnabled = false
            self.M45.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M45.setTitle(String(BrickSelectedNo), for: [])
            self.M45.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func Press_M51(_ sender: AnyObject) {
        if(BrickSelect[4][0] != BrickSelectedNo){
            self.M51.isEnabled = false
            self.M51.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M51.isEnabled = false
            self.M51.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M51.setTitle(String(BrickSelectedNo), for: [])
            self.M51.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
        
    }
    @IBAction func Press_M52(_ sender: AnyObject) {
        if(BrickSelect[4][1] != BrickSelectedNo){
            self.M52.isEnabled = false
            self.M52.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M52.isEnabled = false
            self.M52.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M52.setTitle(String(BrickSelectedNo), for: [])
            self.M52.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M53(_ sender: AnyObject) {
        if(BrickSelect[4][2] != BrickSelectedNo){
            self.M53.isEnabled = false
            self.M53.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M53.isEnabled = false
            self.M53.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M53.setTitle(String(BrickSelectedNo), for: [])
            self.M53.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M54(_ sender: AnyObject) {
        if(BrickSelect[4][3] != BrickSelectedNo){
            self.M54.isEnabled = false
            self.M54.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M54.isEnabled = false
            self.M54.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M54.setTitle(String(BrickSelectedNo), for: [])
            self.M54.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func Press_M55(_ sender: AnyObject) {
        if(BrickSelect[4][4] != BrickSelectedNo){
            self.M55.isEnabled = false
            self.M55.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M55.isEnabled = false
            self.M55.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M55.setTitle(String(BrickSelectedNo), for: [])
            self.M55.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func Press_M16(_ sender: AnyObject) {
        if(BrickSelect[0][5] != BrickSelectedNo){
            self.M16.isEnabled = false
            self.M16.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M16.isEnabled = false
            self.M16.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M16.setTitle(String(BrickSelectedNo), for: [])
            self.M16.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M26(_ sender: AnyObject) {
        if(BrickSelect[1][5] != BrickSelectedNo){
            self.M26.isEnabled = false
            self.M26.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M26.isEnabled = false
            self.M26.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M26.setTitle(String(BrickSelectedNo), for: [])
            self.M26.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M36(_ sender: AnyObject) {
        if(BrickSelect[2][5] != BrickSelectedNo){
            self.M36.isEnabled = false
            self.M36.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M36.isEnabled = false
            self.M36.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M36.setTitle(String(BrickSelectedNo), for: [])
            self.M36.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func Press_M46(_ sender: AnyObject) {
        if(BrickSelect[3][5] != BrickSelectedNo){
            self.M46.isEnabled = false
            self.M46.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M46.isEnabled = false
            self.M46.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M46.setTitle(String(BrickSelectedNo), for: [])
            self.M46.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M56(_ sender: AnyObject) {
        if(BrickSelect[4][5] != BrickSelectedNo){
            self.M56.isEnabled = false
            self.M56.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M56.isEnabled = false
            self.M56.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M56.setTitle(String(BrickSelectedNo), for: [])
            self.M56.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M61(_ sender: AnyObject) {
        if(BrickSelect[5][0] != BrickSelectedNo){
            self.M61.isEnabled = false
            self.M61.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M61.isEnabled = false
            self.M61.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M61.setTitle(String(BrickSelectedNo), for: [])
            self.M61.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M62(_ sender: AnyObject) {
        if(BrickSelect[5][1] != BrickSelectedNo){
            self.M62.isEnabled = false
            self.M62.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M62.isEnabled = false
            self.M62.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M62.setTitle(String(BrickSelectedNo), for: [])
            self.M62.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func Press_M63(_ sender: AnyObject) {
        if(BrickSelect[5][2] != BrickSelectedNo){
            self.M63.isEnabled = false
            self.M63.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M63.isEnabled = false
            self.M63.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M63.setTitle(String(BrickSelectedNo), for: [])
            self.M63.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M64(_ sender: AnyObject) {
        if(BrickSelect[5][3] != BrickSelectedNo){
            self.M64.isEnabled = false
            self.M64.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M64.isEnabled = false
            self.M64.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M64.setTitle(String(BrickSelectedNo), for: [])
            self.M64.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M65(_ sender: AnyObject) {
        if(BrickSelect[5][4] != BrickSelectedNo){
            self.M65.isEnabled = false
            self.M65.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M65.isEnabled = false
            self.M65.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M65.setTitle(String(BrickSelectedNo), for: [])
            self.M65.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    @IBAction func Press_M66(_ sender: AnyObject) {
        if(BrickSelect[5][5] != BrickSelectedNo){
            self.M66.isEnabled = false
            self.M66.backgroundColor = #colorLiteral(red: 0.05259340256, green: 0, blue: 0.1441811323, alpha: 1)
            let FailAlert = UIAlertController(title: "What a pity!", message: "You failed", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
            FailAlert.addAction(OKAction)
            self.present(FailAlert, animated: true, completion: nil)
        }
        else{
            BrickSuccessfullySelect += 1
            self.M66.isEnabled = false
            self.M66.backgroundColor = #colorLiteral(red: 0.8779790998, green: 0.3812967837, blue: 0.5770481825, alpha: 1)
            self.M66.setTitle(String(BrickSelectedNo), for: [])
            self.M66.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: [])
            BrickSelectedNo += 1
            if(BrickSuccessfullySelect == Round_Time + 4){
                if(Round_Time == 20){
                    let finishAlert = UIAlertController(title: "Congratulation", message: "You have won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: viewdestruct)
                    finishAlert.addAction(OKAction)
                }
                else{
                    let SucAlert = UIAlertController(title: "Great", message: "Prepare for the next turn!", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    SucAlert.addAction(OKAction)
                    Round_Time += 1
                    BrickSuccessfullySelect = 0
                    BrickSelectedNo = 1
                    Brick_Already_Select = 0
                    BrickNo = 1
                    self.countdown.isHidden = false
                    self.countdown.isEnabled = true
                    self.present(SucAlert,animated:true,completion: nil)
                }
            }
        }
    }
    override func viewDidLoad() {
        var Buttons = [
            [self.M11,self.M12,self.M13,self.M14,self.M15,self.M16],
            [self.M21,self.M22,self.M23,self.M24,self.M25,self.M26],
            [self.M31,self.M32,self.M33,self.M34,self.M35,self.M36],
            [self.M41,self.M42,self.M43,self.M44,self.M45,self.M46],
            [self.M51,self.M52,self.M53,self.M54,self.M55,self.M56],
            [self.M61,self.M62,self.M63,self.M64,self.M65,self.M66],
            ]
        for i in 0..<6{
            for j in 0..<6{
                (Buttons[i][j]! as UIButton).layer.cornerRadius = 25
                (Buttons[i][j]! as UIButton).layer.masksToBounds = true
            }
        }
        self.countdown.addTarget(self, action: #selector(SequenceEasy.roundaddone), for: UIControlEvents.touchUpInside)
        self.countdown.addTarget(self, action: #selector(SequenceEasy.GameInit), for: UIControlEvents.touchUpInside)
        self.Title_Score.text = "Round:0/20"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
