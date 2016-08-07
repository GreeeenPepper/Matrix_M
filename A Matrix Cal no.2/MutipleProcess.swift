//
//  MutipleProcess.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/6.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit

class MutipleProcesss:UIViewController{
    var Matrix_A_Row = 0
    var Matrix_A_Line = 0
    var Matrix_B_Row = 0
    var Matrix_B_Line = 0
    var MatrixA = [[Float]](repeating:[Float](repeating:0,count:4),count:4)
    var MatrixB_Value = [[Float]](repeating:[Float](repeating:0,count:4),count:4)
    var Matrix_Result = [[Float]](repeating:[Float](repeating:0,count:4),count:4)
    @IBOutlet weak var MatrixB_Row: UITextField!
    @IBOutlet weak var MatrixB_Line: UITextField!
    @IBOutlet weak var MB_11: UITextField!
    @IBOutlet weak var MB_12: UITextField!
    @IBOutlet weak var MB_13: UITextField!
    @IBOutlet weak var MB_14: UITextField!
    @IBOutlet weak var MB_21: UITextField!
    @IBOutlet weak var MB_22: UITextField!
    @IBOutlet weak var MB_23: UITextField!
    @IBOutlet weak var MB_24: UITextField!
    @IBOutlet weak var MB_31: UITextField!
    @IBOutlet weak var MB_32: UITextField!
    @IBOutlet weak var MB_33: UITextField!
    @IBOutlet weak var MB_34: UITextField!
    @IBOutlet weak var MB_41: UITextField!
    @IBOutlet weak var MB_42: UITextField!
    @IBOutlet weak var MB_43: UITextField!
    @IBOutlet weak var MB_44: UITextField!
    func check1()->Bool{
        var error_flag = false
        if(!self.MatrixB_Row.hasText()){
            error_flag = true
        }
        else{
            if(Int(self.MatrixB_Row.text!)==nil || Int(self.MatrixB_Row.text!) > 4){
                error_flag = true
            }
            else{
                Matrix_B_Row = Int(self.MatrixB_Row.text!)!
            }
        }
        if(!self.MatrixB_Line.hasText()){
            error_flag = true
        }
        else{
            if(Int(self.MatrixB_Line.text!)==nil || Int(self.MatrixB_Line.text!) > 4){
                error_flag = true
            }
            else{
                Matrix_B_Line = Int(self.MatrixB_Line.text!)!
            }
        }
        return error_flag
    }
    func check2() -> Bool{
        var error_flag = false
        var MatrixB_HasText = [
            [self.MB_11.hasText(),self.MB_12.hasText(),self.MB_13.hasText(),self.MB_14.hasText()],
            [self.MB_21.hasText(),self.MB_22.hasText(),self.MB_23.hasText(),self.MB_24.hasText()],
            [self.MB_31.hasText(),self.MB_32.hasText(),self.MB_33.hasText(),self.MB_34.hasText()],
            [self.MB_41.hasText(),self.MB_42.hasText(),self.MB_43.hasText(),self.MB_44.hasText()]
        ]
        var MB_Text = [
            [self.MB_11.text,self.MB_12.text,self.MB_13.text,self.MB_14.text],
            [self.MB_21.text,self.MB_22.text,self.MB_23.text,self.MB_24.text],
            [self.MB_31.text,self.MB_32.text,self.MB_33.text,self.MB_34.text],
            [self.MB_41.text,self.MB_42.text,self.MB_43.text,self.MB_44.text]
        ]

        for i in 0..<Matrix_B_Row {
            for j in 0..<Matrix_B_Line {
                if(!MatrixB_HasText[i][j]){
                    error_flag = true
                }
                else{
                    let str = MB_Text[i][j]
                    let num = Float(str!)
                    if(num==nil){
                        error_flag = true
                    }
                    else{
                        MatrixB_Value[i][j] = num!
                    }
                }
            }
        }
        return error_flag
    }
    
    
    func gobackPage(firstAction:UIAlertAction){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func Compute(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "Warning", message: "Invalid Input", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertView.addAction(OKAction)
        if(check1()){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            if(check2()){
                self.present(alertView, animated: true, completion: nil)
            }
            else{
                if(Matrix_A_Line != Matrix_B_Row){
                    let alertOfLineNotEqaulRow = UIAlertController(title: "Warning", message: "第一个矩阵的列数与该矩阵行数不同，无法相乘！", preferredStyle: UIAlertControllerStyle.alert)
                    let firstAction = UIAlertAction(title: "修改第一个矩阵", style: UIAlertActionStyle.default, handler: gobackPage)
                    let secondAction = UIAlertAction(title: "修改第二个矩阵", style: UIAlertActionStyle.default, handler: nil)
                    alertOfLineNotEqaulRow.addAction(firstAction)
                    alertOfLineNotEqaulRow.addAction(secondAction)
                    self.present(alertOfLineNotEqaulRow, animated: true, completion: nil)
                }
                else{
                    for i in 0..<Matrix_A_Row{
                        for j in 0..<Matrix_B_Line{
                            var temp :Float? = 0
                            for a in 0..<Matrix_A_Line{
                                temp = temp! + MatrixA[i][a] * MatrixB_Value[a][i]
                            }
                            Matrix_Result[i][j] = temp!
                        }
                    }
                    
                    let storyboard = UIStoryboard(name:"Main",bundle: nil)
                    let resultpage = storyboard.instantiateViewController(withIdentifier: "result") as! ResultPageOfAddMinus
                    
                    resultpage.Matrix_Row = Matrix_A_Row
                    resultpage.Matrix_Line = Matrix_B_Line
                    for i in 0..<Matrix_A_Row {
                        for j in 0..<Matrix_B_Line {
                            resultpage.MatrixValue[i][j]=Matrix_Result[i][j]
                        }
                    }
                    
                    self.present(resultpage,animated:true,completion:nil)
                    
                }//end of else
            }//end of else
        }//end of else
    }//end of func
    
    @IBAction func Back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func All_Resign(_ sender: AnyObject) {
            self.MatrixB_Row.resignFirstResponder()
            self.MatrixB_Line.resignFirstResponder()
            self.MB_11.resignFirstResponder()
            self.MB_12.resignFirstResponder()
            self.MB_13.resignFirstResponder()
        self.MB_14.resignFirstResponder()
        self.MB_21.resignFirstResponder()
        self.MB_22.resignFirstResponder()
        self.MB_23.resignFirstResponder()
        self.MB_24.resignFirstResponder()
        self.MB_31.resignFirstResponder()
        self.MB_32.resignFirstResponder()
        self.MB_33.resignFirstResponder()
        self.MB_34.resignFirstResponder()
        self.MB_41.resignFirstResponder()
        self.MB_42.resignFirstResponder()
        self.MB_43.resignFirstResponder()
        self.MB_44.resignFirstResponder()
    }
    @IBAction func MatrixB_Row_resign(_ sender: AnyObject) {
        self.MatrixB_Row.resignFirstResponder()
    }
    @IBAction func MatrixB_Line_resign(_ sender: AnyObject) {
        self.MatrixB_Line.resignFirstResponder()
    }
    @IBAction func MB_11_resign(_ sender: AnyObject) {
        self.MB_11.resignFirstResponder()
    }
    @IBAction func MB_12_resign(_ sender: AnyObject) {
        self.MB_12.resignFirstResponder()
    }
    @IBAction func MB_13_resign(_ sender: AnyObject) {
        self.MB_13.resignFirstResponder()
    }
    @IBAction func MB_14_resign(_ sender: AnyObject) {
        self.MB_14.resignFirstResponder()
    }
    @IBAction func MB_21_resign(_ sender: AnyObject) {
        self.MB_21.resignFirstResponder()
    }
    @IBAction func MB_22_resign(_ sender: AnyObject) {
        self.MB_22.resignFirstResponder()
    }
    @IBAction func MB_23_resign(_ sender: AnyObject) {
        self.MB_23.resignFirstResponder()
    }
    @IBAction func MB_24_resign(_ sender: AnyObject) {
        self.MB_24.resignFirstResponder()
    }
    @IBAction func MB_31_resign(_ sender: AnyObject) {
        self.MB_31.resignFirstResponder()
    }
    @IBAction func MB_32_resign(_ sender: AnyObject) {
        self.MB_32.resignFirstResponder()
    }
    @IBAction func MB_33_resign(_ sender: AnyObject) {
        self.MB_33.resignFirstResponder()
    }
    @IBAction func MB_34_resign(_ sender: AnyObject) {
        self.MB_34.resignFirstResponder()
    }
    @IBAction func MB_41_resign(_ sender: AnyObject) {
        self.MB_41.resignFirstResponder()
    }
    @IBAction func MB_42_resign(_ sender: AnyObject) {
        self.MB_42.resignFirstResponder()
    }
    @IBAction func MB_43_resign(_ sender: AnyObject) {
        self.MB_43.resignFirstResponder()
    }
    @IBAction func MB_44_resign(_ sender: AnyObject) {
        self.MB_44.resignFirstResponder()
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
