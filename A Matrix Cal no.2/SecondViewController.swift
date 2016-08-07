//
//  SecondViewController.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/6.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var MatrixA_Row_Num = 0
    var MatrixA_Line_Num = 0
    var MatrixA_Value = [[Float]](repeating:[Float](repeating:0,count:4),count:4)
    @IBOutlet weak var MatrixA_Row: UITextField!
    @IBOutlet weak var MatrixA_Line: UITextField!
    @IBOutlet weak var MatrixA_11: UITextField!
    @IBOutlet weak var MatrixA_12: UITextField!
    @IBOutlet weak var MatrixA_13: UITextField!
    @IBOutlet weak var MatrixA_14: UITextField!
    @IBOutlet weak var MatrixA_21: UITextField!
    @IBOutlet weak var MatrixA_22: UITextField!
    @IBOutlet weak var MatrixA_23: UITextField!
    @IBOutlet weak var MatrixA_24: UITextField!
    @IBOutlet weak var MatrixA_31: UITextField!
    @IBOutlet weak var MatrixA_32: UITextField!
    @IBOutlet weak var MatrixA_33: UITextField!
    @IBOutlet weak var MatrixA_34: UITextField!
    @IBOutlet weak var MatrixA_41: UITextField!
    @IBOutlet weak var MatrixA_42: UITextField!
    @IBOutlet weak var MatrixA_43: UITextField!
    @IBOutlet weak var MatrixA_44: UITextField!
  
    
    
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    
    
    
    func check1() -> Bool{
        var error_flag = false
        if(!self.MatrixA_Row.hasText()){
            error_flag = true
        }else{
            let str = self.MatrixA_Row.text
            let num = Int(str!)
            if(num==nil || num>4){
                error_flag = true
            }
            else{
                MatrixA_Row_Num = num!
            }
        }
        if(!self.MatrixA_Line.hasText()){
            error_flag = true
        }else{
            let str = self.MatrixA_Line.text
            let num = Int(str!)
            if(num==nil || num>4){
                error_flag = true
            }
            else{
                MatrixA_Line_Num = num!
            }
        }
        return error_flag
    }
    func check2() -> Bool{
        var error_flag = false
        var MatrixA_HasText = [
        [self.MatrixA_11.hasText(),self.MatrixA_12.hasText(),self.MatrixA_13.hasText(),self.MatrixA_14.hasText()],
        [self.MatrixA_21.hasText(),self.MatrixA_22.hasText(),self.MatrixA_23.hasText(),self.MatrixA_24.hasText()],
        [self.MatrixA_31.hasText(),self.MatrixA_32.hasText(),self.MatrixA_33.hasText(),self.MatrixA_34.hasText()],
        [self.MatrixA_41.hasText(),self.MatrixA_42.hasText(),self.MatrixA_43.hasText(),self.MatrixA_44.hasText()]
    ]
        var MatrixA_Text = [
            [self.MatrixA_11.text,self.MatrixA_12.text,self.MatrixA_13.text,self.MatrixA_14.text],
            [self.MatrixA_21.text,self.MatrixA_22.text,self.MatrixA_23.text,self.MatrixA_24.text],
            [self.MatrixA_31.text,self.MatrixA_32.text,self.MatrixA_33.text,self.MatrixA_34.text],
            [self.MatrixA_41.text,self.MatrixA_42.text,self.MatrixA_43.text,self.MatrixA_44.text]
        ]
        for i in 0..<MatrixA_Row_Num {
            for j in 0..<MatrixA_Line_Num {
                if(!MatrixA_HasText[i][j]){
                    error_flag = true
                }
                else{
                    let str = MatrixA_Text[i][j]
                    let num = Float(str!)
                    if(num==nil){
                        error_flag = true
                    }
                    else{
                        MatrixA_Value[i][j] = num!
                    }
                }
            }
        }
        return error_flag
    }
    func gotoMatrixB(OKAction2:UIAlertAction) {
        let storyboard = UIStoryboard(name:"Main",bundle: nil)
        let nextMatrixpage = storyboard.instantiateViewController(withIdentifier: "multiplication") as! MutipleProcesss
        
        nextMatrixpage.Matrix_A_Row = MatrixA_Row_Num
        nextMatrixpage.Matrix_A_Line = MatrixA_Line_Num
        for i in 0..<MatrixA_Row_Num {
            for j in 0..<MatrixA_Line_Num {
                nextMatrixpage.MatrixA[i][j] = MatrixA_Value[i][j]
            }
        }
        self.present(nextMatrixpage,animated: true,completion: nil)
        //return
    }
    @IBAction func mutliple(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "Warning", message: "Invalid Input", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
        alertView.addAction(OKAction)
        if(check1()){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            if(check2()){
                self.present(alertView, animated: true, completion: nil)
            }
            else{

            
                let alertView2 = UIAlertController(title: "NEXT", message: "Please Enter the Second Matrix", preferredStyle: UIAlertControllerStyle.alert)
                let OKAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: gotoMatrixB)
                alertView2.addAction(OKAction2)
                self.present(alertView2, animated: true, completion: nil)
            }
        }
    }
    func transformMatrix( array: inout [[Float]],n:Int){
        for i in 0..<n{
            for j in i..<n{
                let temp = array[i][j]
                array[i][j] = array[j][i]
                array[j][i] = temp
            }
        }
    }
    @IBAction func TransformMatrix(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "Warning", message: "Invalid Input", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
        alertView.addAction(OKAction)
        if(check1()){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            if(check2()){
                self.present(alertView, animated: true, completion: nil)
            }
            else{
                transformMatrix(array: &MatrixA_Value,n: 4)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let resultpage = storyboard.instantiateViewController(withIdentifier: "result") as! ResultPageOfAddMinus
                resultpage.Matrix_Row = MatrixA_Line_Num
                resultpage.Matrix_Line = MatrixA_Row_Num
                for i in 0..<4 {
                    for j in 0..<4 {
                        resultpage.MatrixValue[i][j] = MatrixA_Value[i][j]
                    }
                }
              self.present(resultpage, animated: true, completion: nil)
                
            }
        }
    }
    
    func CaculateDetForEdgeEqual1() ->Float{
        return MatrixA_Value[0][0]
    }
    func CaculateDetForEdgeEqual2(array:[[Float]]) ->Float{
        return array[0][0] * array[1][1] - array[1][0] * array[0][1]
    }
    func CaculateDetForEdgeEqual3(array:[[Float]]) ->Float{
        return array[0][0] * array[1][1] * array[2][2] + array[0][1] * array[1][2] * array[2][0] + array[0][2] * array[1][0] * array[2][1] - array[0][2] * array[1][1] * array[2][0] - array[0][1] * array[1][0] * array[2][2] - array[0][0] * array[1][2] * array[2][1]
    }
    func CaculateDetForEdgeEqual4() ->Float{
        return MatrixA_Value[0][0] * (MatrixA_Value[1][1] * MatrixA_Value[2][2] * MatrixA_Value[3][3] + MatrixA_Value[1][2] * MatrixA_Value[2][3] * MatrixA_Value[3][1] + MatrixA_Value[1][3] * MatrixA_Value[2][1] * MatrixA_Value[3][2] - MatrixA_Value[3][1] * MatrixA_Value[2][2] * MatrixA_Value[1][3] - MatrixA_Value[1][2] * MatrixA_Value[2][1] * MatrixA_Value[3][3] - MatrixA_Value[1][1] * MatrixA_Value[2][3] * MatrixA_Value[3][2]) + (-1) * MatrixA_Value[0][1] * (MatrixA_Value[1][0] * MatrixA_Value[2][2] * MatrixA_Value[3][3] + MatrixA_Value[1][2] * MatrixA_Value[2][3] * MatrixA_Value[3][0] + MatrixA_Value[1][3] * MatrixA_Value[2][0] * MatrixA_Value[3][2] - MatrixA_Value[1][3] * MatrixA_Value[2][2] * MatrixA_Value[3][0] - MatrixA_Value[1][2] * MatrixA_Value[2][0] * MatrixA_Value[3][3] - MatrixA_Value[1][0] * MatrixA_Value[2][3] * MatrixA_Value[3][2]) + MatrixA_Value[0][2] * (MatrixA_Value[1][0] * MatrixA_Value[2][1] * MatrixA_Value[3][3] + MatrixA_Value[1][1] * MatrixA_Value[2][3] * MatrixA_Value[3][0] + MatrixA_Value[1][3] * MatrixA_Value[2][0] * MatrixA_Value[3][1] - MatrixA_Value[1][3] * MatrixA_Value[2][1] * MatrixA_Value[3][0] - MatrixA_Value[1][1] * MatrixA_Value[2][0] * MatrixA_Value[3][3] - MatrixA_Value[1][0] * MatrixA_Value[2][3] * MatrixA_Value[3][1]) + (-1) * MatrixA_Value[0][3] * (MatrixA_Value[1][0] * MatrixA_Value[2][1] * MatrixA_Value[3][2] + MatrixA_Value[1][1] * MatrixA_Value[2][2] * MatrixA_Value[3][0] + MatrixA_Value[1][2] * MatrixA_Value[2][0] * MatrixA_Value[3][1] - MatrixA_Value[1][2] * MatrixA_Value[2][1] * MatrixA_Value[3][0] - MatrixA_Value[1][1] * MatrixA_Value[2][0] * MatrixA_Value[3][2] - MatrixA_Value[1][0] * MatrixA_Value[2][2] * MatrixA_Value[3][1])
    }


    @IBAction func CaculateDet(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "Warning", message: "Invalid Input", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
        alertView.addAction(OKAction)
        if(check1()){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            if(check2()){
                self.present(alertView, animated: true, completion: nil)
            }
            else{
                let alertNotaDet = UIAlertController(title: "Warning", message: "Must be a SQUARE!", preferredStyle: UIAlertControllerStyle.alert)
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alertNotaDet.addAction(OKAction)
                if(MatrixA_Line_Num != MatrixA_Row_Num){
                    self.present(alertNotaDet,animated: true,completion: nil)
                }
                else{
                    
                    let edge = MatrixA_Row_Num
                    var result:Float? = 0
                    if(edge == 1){
                         result = CaculateDetForEdgeEqual1()
                    }
                    else if(edge == 2){
                        result = CaculateDetForEdgeEqual2(array: MatrixA_Value)
                    }
                    else if(edge == 3){
                        result = CaculateDetForEdgeEqual3(array: MatrixA_Value)
                    }
                    else if(edge == 4){
                        result = CaculateDetForEdgeEqual4()
                    }
                    ResultLabel.text = "det(A) = " + String(result!)
                }
            }
        }
    }
    @IBAction func CompanyMatrix(_ sender: AnyObject) {
        
        let alertView = UIAlertController(title: "Warning", message: "Invalid Input", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
        alertView.addAction(OKAction)
        if(check1()){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            if(check2()){
                self.present(alertView, animated: true, completion: nil)
            }
            else{
                let alertNotaDet = UIAlertController(title: "Warning", message: "Must be a SQUARE!", preferredStyle: UIAlertControllerStyle.alert)
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alertNotaDet.addAction(OKAction)
                if(MatrixA_Line_Num != MatrixA_Row_Num){
                    self.present(alertNotaDet,animated: true,completion: nil)
                }
                else{
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let resultpage = storyboard.instantiateViewController(withIdentifier: "result") as! ResultPageOfAddMinus
                    let edge = MatrixA_Row_Num
                    resultpage.Matrix_Row = edge
                    resultpage.Matrix_Line = edge
                    if(edge == 1){
                        resultpage.MatrixValue[0][0] = 1
                    }
                    else if(edge == 2){
                        resultpage.MatrixValue[0][0] = MatrixA_Value[1][1]
                        resultpage.MatrixValue[0][1] = (-1) * MatrixA_Value[0][1]
                        resultpage.MatrixValue[1][0] = (-1) * MatrixA_Value[1][0]
                        resultpage.MatrixValue[1][1] = MatrixA_Value[0][0]
                    }
                    else if(edge == 3){
                        var Temp = [[Float]](repeating:[Float](repeating:0,count:3),count:3)
                        for i in 0..<3{
                            for j in 0..<3{
                                var YuZi = [[Float]](repeating:[Float](repeating:0,count:2),count:2)
                                var a:Int = 0
                                var b:Int = 0
                                for q in 0..<3{
                                    for p in 0..<3{
                                        if(!(q==i || p==j)){
                                            if(b>=2){
                                                b = 0
                                                a = a+1
                                            }
                                            YuZi[a][b] = MatrixA_Value[q][p]
                                            b = b+1
                                        }
                                    }
                                }
                                let yuzishi = CaculateDetForEdgeEqual2(array: YuZi)
                                var flag:Float
                                if((i+j)%2==0){
                                    flag = 1
                                }
                                else{
                                    flag = -1
                                }
                                Temp[i][j] = flag * yuzishi
                            }
                        }
                        transformMatrix(array: &Temp, n: 3)
                        for i in 0..<3{
                            for j in 0..<3{
                                resultpage.MatrixValue[i][j] = Temp[i][j]
                            }
                        }
                    }//end of edge 3
                    else if(edge == 4){
                        
                        
                        var Temp = [[Float]](repeating:[Float](repeating:0,count:4),count:4)
                        for i in 0..<4{
                            for j in 0..<4{
                                var YuZi = [[Float]](repeating:[Float](repeating:0,count:3),count:3)
                                var a:Int = 0
                                var b:Int = 0
                                for q in 0..<4{
                                    for p in 0..<4{
                                        if(!(q==i || p==j)){
                                            if(b>=3){
                                                b = 0
                                                a = a+1
                                            }
                                            YuZi[a][b] = MatrixA_Value[q][p]
                                            b = b+1
                                        }
                                    }
                                }
                                let yuzishi = CaculateDetForEdgeEqual3(array: YuZi)
                                var flag:Float
                                if((i+j)%2==0){
                                    flag = 1
                                }
                                else{
                                    flag = -1
                                }
                                Temp[i][j] = flag * yuzishi
                            }
                        }
                        transformMatrix(array: &Temp, n: 4)
                        for i in 0..<4{
                            for j in 0..<4{
                                resultpage.MatrixValue[i][j] = Temp[i][j]
                            }
                        }
                    }
                    self.present(resultpage, animated: true, completion: nil)
                }
            }
        }
    
    }
    @IBAction func InverseMatrix(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "Warning", message: "Invalid Input", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
        alertView.addAction(OKAction)
        if(check1()){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            if(check2()){
                self.present(alertView, animated: true, completion: nil)
            }
            else{
                let alertNotaDet = UIAlertController(title: "Warning", message: "Must be a SQUARE!", preferredStyle: UIAlertControllerStyle.alert)
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alertNotaDet.addAction(OKAction)
                if(MatrixA_Line_Num != MatrixA_Row_Num){
                    self.present(alertNotaDet,animated: true,completion: nil)
                }
                else{
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let resultpage = storyboard.instantiateViewController(withIdentifier: "result") as! ResultPageOfAddMinus
                    let edge = MatrixA_Row_Num
                    resultpage.Matrix_Row = edge
                    resultpage.Matrix_Line = edge
                    
                    
                    let AlertDetEqualZero = UIAlertController(title: "Warning", message: "Matrix Do Not Have A Inverse", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    AlertDetEqualZero.addAction(OKAction)
                    
                    
                    if(edge == 1){
                        if(CaculateDetForEdgeEqual1() == 0){
                            self.present(AlertDetEqualZero, animated: true, completion: nil)
                        }
                        resultpage.MatrixValue[0][0] =  1 / CaculateDetForEdgeEqual1()
                    }
                    else if(edge == 2){
                        if(CaculateDetForEdgeEqual2(array: MatrixA_Value) == 0){
                            self.present(AlertDetEqualZero, animated: true, completion: nil)
                        }
                        else{
                        resultpage.MatrixValue[0][0] = MatrixA_Value[1][1] / CaculateDetForEdgeEqual2(array: MatrixA_Value)
                        resultpage.MatrixValue[0][1] = (-1) * MatrixA_Value[0][1] / CaculateDetForEdgeEqual2(array: MatrixA_Value)
                        resultpage.MatrixValue[1][0] = (-1) * MatrixA_Value[1][0] / CaculateDetForEdgeEqual2(array: MatrixA_Value)
                        resultpage.MatrixValue[1][1] = MatrixA_Value[0][0] / CaculateDetForEdgeEqual2(array: MatrixA_Value)
                        }
                    }
                    else if(edge == 3){
                        if(CaculateDetForEdgeEqual3(array: MatrixA_Value) == 0){
                            self.present(AlertDetEqualZero, animated: true, completion: nil)
                        }
                        else{
                        var Temp = [[Float]](repeating:[Float](repeating:0,count:3),count:3)
                        for i in 0..<3{
                            for j in 0..<3{
                                var YuZi = [[Float]](repeating:[Float](repeating:0,count:2),count:2)
                                var a:Int = 0
                                var b:Int = 0
                                for q in 0..<3{
                                    for p in 0..<3{
                                        if(!(q==i || p==j)){
                                            if(b>=2){
                                                b = 0
                                                a = a+1
                                            }
                                            YuZi[a][b] = MatrixA_Value[q][p]
                                            b = b+1
                                        }
                                    }
                                }
                                let yuzishi = CaculateDetForEdgeEqual2(array: YuZi)
                                var flag:Float
                                if((i+j)%2==0){
                                    flag = 1
                                }
                                else{
                                    flag = -1
                                }
                                Temp[i][j] = flag * yuzishi
                            }
                        }
                        transformMatrix(array: &Temp, n: 3)
                        for i in 0..<3{
                            for j in 0..<3{
                                resultpage.MatrixValue[i][j] = Temp[i][j] / CaculateDetForEdgeEqual3(array: MatrixA_Value)
                            }
                        }
                    }
                }//end of edge 3
                    else if(edge == 4){
                        if(CaculateDetForEdgeEqual4() == 0){
                            self.present(AlertDetEqualZero, animated: true, completion: nil)
                        }
                        else{
                        var Temp = [[Float]](repeating:[Float](repeating:0,count:4),count:4)
                        for i in 0..<4{
                            for j in 0..<4{
                                var YuZi = [[Float]](repeating:[Float](repeating:0,count:3),count:3)
                                var a:Int = 0
                                var b:Int = 0
                                for q in 0..<4{
                                    for p in 0..<4{
                                        if(!(q==i || p==j)){
                                            if(b>=3){
                                                b = 0
                                                a = a+1
                                            }
                                            YuZi[a][b] = MatrixA_Value[q][p]
                                            b = b+1
                                        }
                                    }
                                }
                                let yuzishi = CaculateDetForEdgeEqual3(array: YuZi)
                                var flag:Float
                                if((i+j)%2==0){
                                    flag = 1
                                }
                                else{
                                    flag = -1
                                }
                                Temp[i][j] = flag * yuzishi
                            }
                        }
                        transformMatrix(array: &Temp, n: 4)
                        for i in 0..<4{
                            for j in 0..<4{
                                resultpage.MatrixValue[i][j] = Temp[i][j] / CaculateDetForEdgeEqual4()
                            }
                        }
                    }
                }
                    self.present(resultpage, animated: true, completion: nil)
            }
        }
    }
            

    
    
    
    
    
    
    
    }
    
    func Rank (array:[[Float]],error_:Int,row:Int,line:Int)-> Int{
        var n = row
        var m = line
        var i:Int = 0
        var i1:Int
        var j :Int = 0
        var temp1 : Float
        if(m>n)
        {
            i=m;
            m=n;
            n=i;
            i=1;
        }
        m-=1;
        n-=1;
        var temp_Matrix = [[Float]](repeating:[Float](repeating:0,count:n+1),count:m+1)
        //double[][]temp=new double[m+1][n+1];
//        print(m)
//        print(n)
        if(i==0)
        {
            for i in 0...m //(i=0;i<=m;i++)
            {
                for j in 0...n//(j=0;j<=n;j++)
                {
//                    print(i)
//                    print(j)
                    temp_Matrix[i][j]=array[i][j];
                }
                
            }
        }
        else
        {
            for i in 0...m//(i=0;i<=m;i++)0 1
            {
                for j in 0...n //(j=0;j<=n;j++) 0 1 2
                {
//                    print(i)
//                    print(j)
                    temp_Matrix[i][j]=array[j][i];
                }
            }
        }
        if(m==0)
        {
            i=0;
            while(i<=n)
            {
                if(array[0][i] != 0)
                {
                    return 1;
                }
                i+=1;
            }
            return 0;
        }
        var error0:Float
        //double error0;
        if(error_ == -1)
        {
            error0 = pow(0.1, 10);
//            print(error0)
        }
        else
        {
            error0 = pow(0.1, Float(error_));
//            print(error0)
        }
        i=0;
        while(i<=m)
        {
            j=0;
            while(j<=n)
            {
                if(temp_Matrix[i][j] != 0)
                {
                    error0 = error0 * temp_Matrix[i][j];
                    i=m;
                    break;
                }
                j+=1;
            }
            i+=1;
        }
        var error1:Float
        for i in 0...m
        {
            j=0;
            while(j<=n)
            {
                if(temp_Matrix[i][j] != 0)
                {
                    break;
                }
                j+=1;
            }
            if(j<=n)
            {
                i1=0;
                while(i1<=m)
                {
                    if(temp_Matrix[i1][j] != 0 && i1 != i)
                    {
                        temp1=temp_Matrix[i][j]/temp_Matrix[i1][j];
                        error1=abs((temp_Matrix[i][j]-temp_Matrix[i1][j]*temp1))*100;
                        error1+=error0;
                        for j1 in 0...n//(j1=0;j1<=n;j1++)
                        {
                            temp_Matrix[i1][j1]=temp_Matrix[i][j1]-temp_Matrix[i1][j1]*temp1;
                            if(abs(temp_Matrix[i1][j1])<error1)
                            {
                                temp_Matrix[i1][j1]=0;
                            }
                        }
                        
                    }
                    i1+=1;
                }
            }
        }
        
        i1=0;
        for i in 0...m //(i=0;i<=m;i++)
        {
            for j in 0...n//(j=0;j<=n;j++)
            {
                if(temp_Matrix[i][j] != 0)
                {
                    i1+=1;
                    break;
                }
            }
        }
        return i1;
    }
    
    
    
    @IBAction func getRank(_ sender: AnyObject) {
        let alertView = UIAlertController(title: "Warning", message: "Invalid Input", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
        alertView.addAction(OKAction)
        if(check1()){
            self.present(alertView, animated: true, completion: nil)
        }
        else{
            if(check2()){
                self.present(alertView, animated: true, completion: nil)
            }
            else{
                let rank = Rank(array: MatrixA_Value,error_:-1,row:4,line:4)
                ResultLabel.text = "R(A)="+String(rank)
            }
        }
    }
    
    @IBAction func All_Resign(_ sender: AnyObject) {
        self.MatrixA_Row.resignFirstResponder()
        self.MatrixA_Line.resignFirstResponder()
        self.MatrixA_11.resignFirstResponder()
        self.MatrixA_12.resignFirstResponder()
        self.MatrixA_13.resignFirstResponder()
        self.MatrixA_14.resignFirstResponder()
        self.MatrixA_21.resignFirstResponder()
        self.MatrixA_22.resignFirstResponder()
        self.MatrixA_23.resignFirstResponder()
        self.MatrixA_24.resignFirstResponder()
        self.MatrixA_31.resignFirstResponder()
        self.MatrixA_32.resignFirstResponder()
        self.MatrixA_33.resignFirstResponder()
        self.MatrixA_34.resignFirstResponder()
        self.MatrixA_41.resignFirstResponder()
        self.MatrixA_42.resignFirstResponder()
        self.MatrixA_43.resignFirstResponder()
        self.MatrixA_44.resignFirstResponder()
    }
    
    @IBAction func MatrixA_Row_resign(_ sender: AnyObject) {
        self.MatrixA_Row.resignFirstResponder()
    }
    @IBAction func MatrixA_Line_resign(_ sender: AnyObject) {
        self.MatrixA_Line.resignFirstResponder()
    }
    @IBAction func MB_11_resign(_ sender: AnyObject) {
        self.MatrixA_11.resignFirstResponder()
    }
    @IBAction func MB_12_resign(_ sender: AnyObject) {
        self.MatrixA_12.resignFirstResponder()
    }
    @IBAction func MB_13_resign(_ sender: AnyObject) {
        self.MatrixA_13.resignFirstResponder()
    }
    @IBAction func MB_14_resign(_ sender: AnyObject) {
        self.MatrixA_14.resignFirstResponder()
    }
    @IBAction func MB_21_resign(_ sender: AnyObject) {
        self.MatrixA_21.resignFirstResponder()
    }
    @IBAction func MB_22_resign(_ sender: AnyObject) {
        self.MatrixA_22.resignFirstResponder()
    }
    @IBAction func MB_23_resign(_ sender: AnyObject) {
        self.MatrixA_23.resignFirstResponder()
    }
    @IBAction func MB_24_resign(_ sender: AnyObject) {
        self.MatrixA_24.resignFirstResponder()
    }
    @IBAction func MB_31_resign(_ sender: AnyObject) {
        self.MatrixA_31.resignFirstResponder()
    }
    @IBAction func MB_32_resign(_ sender: AnyObject) {
        self.MatrixA_32.resignFirstResponder()
    }
    @IBAction func MB_33_resign(_ sender: AnyObject) {
        self.MatrixA_33.resignFirstResponder()
    }
    @IBAction func MB_34_resign(_ sender: AnyObject) {
        self.MatrixA_34.resignFirstResponder()
    }
    @IBAction func MB_41_resign(_ sender: AnyObject) {
        self.MatrixA_41.resignFirstResponder()
    }
    @IBAction func MB_42_resign(_ sender: AnyObject) {
        self.MatrixA_42.resignFirstResponder()
    }
    @IBAction func MB_43_resign(_ sender: AnyObject) {
        self.MatrixA_43.resignFirstResponder()
    }
    @IBAction func MB_44_resign(_ sender: AnyObject) {
        self.MatrixA_44.resignFirstResponder()
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

