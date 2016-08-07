//
//  FirstViewController.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/6.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var error_flag = false
    
    @IBOutlet weak var Matrix_AorM_Row: UITextField!
    @IBOutlet weak var Matrix_AorM_Line: UITextField!
    
    @IBOutlet weak var M1_11: UITextField!
    @IBOutlet weak var M1_12: UITextField!
    @IBOutlet weak var M1_13: UITextField!
    @IBOutlet weak var M1_21: UITextField!
    @IBOutlet weak var M1_22: UITextField!
    @IBOutlet weak var M1_23: UITextField!
    @IBOutlet weak var M1_31: UITextField!
    @IBOutlet weak var M1_32: UITextField!
    @IBOutlet weak var M1_33: UITextField!
    @IBOutlet weak var M2_11: UITextField!
    @IBOutlet weak var M2_12: UITextField!
    @IBOutlet weak var M2_13: UITextField!
    @IBOutlet weak var M2_21: UITextField!
    @IBOutlet weak var M2_22: UITextField!
    @IBOutlet weak var M2_23: UITextField!
    @IBOutlet weak var M2_31: UITextField!
    @IBOutlet weak var M2_32: UITextField!
    @IBOutlet weak var M2_33: UITextField!
  
    
    
    @IBAction func ResignFirstRespondAll(_ sender: AnyObject) {
        self.Matrix_AorM_Line.resignFirstResponder()
        self.Matrix_AorM_Row.resignFirstResponder()
        self.M1_11.resignFirstResponder()
        self.M1_12.resignFirstResponder()
        self.M1_13.resignFirstResponder()
        self.M1_21.resignFirstResponder()
        self.M1_22.resignFirstResponder()
        self.M1_23.resignFirstResponder()
        self.M1_31.resignFirstResponder()
        self.M1_32.resignFirstResponder()
        self.M1_33.resignFirstResponder()
        self.M2_11.resignFirstResponder()
        self.M2_12.resignFirstResponder()
        self.M2_13.resignFirstResponder()
        self.M2_21.resignFirstResponder()
        self.M2_22.resignFirstResponder()
        self.M2_23.resignFirstResponder()
        self.M2_31.resignFirstResponder()
        self.M2_32.resignFirstResponder()
        self.M2_33.resignFirstResponder()
    }//resignFirstResponder for ALL
    
    func check()->Bool{
        var flag1 = true
        if(!self.Matrix_AorM_Row.hasText()){
                flag1 = false
            }
        else{
            let MR :Int? = Int(self.Matrix_AorM_Row.text!)
            if(MR!>3){
                flag1 = false
            }
        }
        if(!self.Matrix_AorM_Line.hasText()){
            flag1 = false
        }
        else{
            let ML :Int? = Int(self.Matrix_AorM_Line.text!)
            if(ML!>3){
                flag1 = false
            }
        }
        return flag1
    }
    
    
    
    @IBAction func Minus(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "警告！", message: "Not Correct Input", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil)
        alertView.addAction(OKAction)
        
        error_flag = false
        if(!check()){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            var MatrixHasText_M1 = [
                [self.M1_11.hasText(),self.M1_12.hasText(),self.M1_13.hasText()],
                [self.M1_21.hasText(),self.M1_22.hasText(),self.M1_23.hasText()],
                [self.M1_31.hasText(),self.M1_32.hasText(),self.M1_33.hasText()],
                ]
            var MatrixHasText_M2 = [
                [self.M2_11.hasText(),self.M2_12.hasText(),self.M2_13.hasText()],
                [self.M2_21.hasText(),self.M2_22.hasText(),self.M2_23.hasText()],
                [self.M2_31.hasText(),self.M2_32.hasText(),self.M2_33.hasText()],
                ]
            var MatrixText_M1 = [
                [self.M1_11.text,self.M1_12.text,self.M1_13.text],
                [self.M1_21.text,self.M1_22.text,self.M1_23.text],
                [self.M1_31.text,self.M1_32.text,self.M1_33.text],
                ]
            var MatrixText_M2 = [
                [self.M2_11.text,self.M2_12.text,self.M2_13.text],
                [self.M2_21.text,self.M2_22.text,self.M2_23.text],
                [self.M2_31.text,self.M2_32.text,self.M2_33.text],
                ]
            let MR :Int? = Int(self.Matrix_AorM_Row.text!)
            let ML :Int? = Int(self.Matrix_AorM_Line.text!)
            for i in 0 ..< MR! {
                for j in 0 ..< ML! {
                    let judge1 = MatrixHasText_M1[i][j]
                    let judge2 = MatrixHasText_M2[i][j]
                    if(judge1==false){
                        error_flag = true
                    }
                    else{
                        if(Float(MatrixText_M1[i][j]!)==nil){
                            error_flag = true
                        }
                    }
                    if(judge2==false){
                        error_flag = true
                    }
                    else{
                        if(Float(MatrixText_M2[i][j]!)==nil){
                            error_flag = true
                        }
                    }
                }
            }
            
            if(error_flag){
                self.present(alertView, animated: true, completion: nil)
            }
            else{
            let storyboard = UIStoryboard(name:"Main",bundle: nil)
            let resultpage = storyboard.instantiateViewController(withIdentifier: "result") as! ResultPageOfAddMinus
            
            resultpage.Matrix_Row = MR!
            resultpage.Matrix_Line = ML!
            for i in 0..<MR!{
                for j in 0..<ML!{
                    let str1 = MatrixText_M1[i][j]
                    let str2 = MatrixText_M2[i][j]
                    let num1 = Float(str1!)
                    let num2 = Float(str2!)
                    let sub = num1! - num2!
                    resultpage.MatrixValue[i][j]=sub
                }
            }
            self.present(resultpage, animated: true, completion: nil)
        }
    }
}
    
    
    
    @IBAction func Add(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "警告！", message: "Not Correct Input", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil)
        alertView.addAction(OKAction)
        error_flag = false
        if(!check()){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            let MR :Int? = Int(self.Matrix_AorM_Row.text!)
            let ML :Int? = Int(self.Matrix_AorM_Line.text!)
            
        var MatrixHasText_M1 = [
            [self.M1_11.hasText(),self.M1_12.hasText(),self.M1_13.hasText()],
            [self.M1_21.hasText(),self.M1_22.hasText(),self.M1_23.hasText()],
            [self.M1_31.hasText(),self.M1_32.hasText(),self.M1_33.hasText()],
        ]
        var MatrixHasText_M2 = [
            [self.M2_11.hasText(),self.M2_12.hasText(),self.M2_13.hasText()],
            [self.M2_21.hasText(),self.M2_22.hasText(),self.M2_23.hasText()],
            [self.M2_31.hasText(),self.M2_32.hasText(),self.M2_33.hasText()],
        ]
            var MatrixText_M1 = [
                [self.M1_11.text,self.M1_12.text,self.M1_13.text],
                [self.M1_21.text,self.M1_22.text,self.M1_23.text],
                [self.M1_31.text,self.M1_32.text,self.M1_33.text],
            ]
            var MatrixText_M2 = [
                [self.M2_11.text,self.M2_12.text,self.M2_13.text],
                [self.M2_21.text,self.M2_22.text,self.M2_23.text],
                [self.M2_31.text,self.M2_32.text,self.M2_33.text],
            ]
        for i in 0 ..< MR! {
            for j in 0 ..< ML! {
                let judge1 = MatrixHasText_M1[i][j]
                let judge2 = MatrixHasText_M2[i][j]
                if(judge1==false){
                    error_flag = true
                }
                else{
                    if(Float(MatrixText_M1[i][j]!)==nil){
                        error_flag = true
                    }
                }
                if(judge2==false){
                    error_flag = true
                }
                else{
                    if(Float(MatrixText_M2[i][j]!)==nil){
                        error_flag = true
                    }
                }
            }
        }
        
        if(error_flag){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            //传值
            let storyboard = UIStoryboard(name:"Main",bundle: nil)
            let resultpage = storyboard.instantiateViewController(withIdentifier: "result") as! ResultPageOfAddMinus
            
            resultpage.Matrix_Row = MR!
            resultpage.Matrix_Line = ML!
            for i in 0..<MR!{
                for j in 0..<ML!{
                    let str1 = MatrixText_M1[i][j]
                    let str2 = MatrixText_M2[i][j]
                    let num1 = Float(str1!)
                    let num2 = Float(str2!)
                    let sum = num1! + num2!
                    resultpage.MatrixValue[i][j]=sum
                }
            }
        
            self.present(resultpage, animated: true, completion: nil)
        }
    }//end of else
}
    

    //did end on exit
    @IBAction func M1_11_resign(_ sender: AnyObject) {
        self.M1_11.resignFirstResponder()
    }
    @IBAction func M1_12_resign(_ sender: AnyObject) {
        self.M1_12.resignFirstResponder()
    }
    @IBAction func M1_13_resign(_ sender: AnyObject) {
        self.M1_13.resignFirstResponder()
    }
    @IBAction func M1_21_resign(_ sender: AnyObject) {
        self.M1_21.resignFirstResponder()
    }
    @IBAction func M1_22_resign(_ sender: AnyObject) {
        self.M2_22.resignFirstResponder()
    }
    @IBAction func M1_23_resign(_ sender: AnyObject) {
        self.M2_23.resignFirstResponder()
    }
    @IBAction func M1_31_resign(_ sender: AnyObject) {
        self.M1_31.resignFirstResponder()
    }
    @IBAction func M1_32_resign(_ sender: AnyObject) {
        self.M1_32.resignFirstResponder()
    }
    @IBAction func M1_33_resign(_ sender: AnyObject) {
        self.M1_33.resignFirstResponder()
    }
    @IBAction func M2_11_resign(_ sender: AnyObject) {
        self.M2_11.resignFirstResponder()
    }
    @IBAction func M2_12_resign(_ sender: AnyObject) {
        self.M2_12.resignFirstResponder()
    }
    @IBAction func M2_13_resign(_ sender: AnyObject) {
        self.M2_13.resignFirstResponder()
    }
    @IBAction func M2_21_resign(_ sender: AnyObject) {
        self.M2_21.resignFirstResponder()
    }
    @IBAction func M2_22_resign(_ sender: AnyObject) {
        self.M2_22.resignFirstResponder()
    }
    @IBAction func M2_23_resign(_ sender: AnyObject) {
        self.M2_23.resignFirstResponder()
    }
    @IBAction func M2_31_resign(_ sender: AnyObject) {
        self.M2_31.resignFirstResponder()
    }
    @IBAction func M2_32_resign(_ sender: AnyObject) {
        self.M2_32.resignFirstResponder()
    }
    @IBAction func M2_33_resign(_ sender: AnyObject) {
        self.M2_33.resignFirstResponder()
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

