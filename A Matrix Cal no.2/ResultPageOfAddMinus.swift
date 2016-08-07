//
//  ResultPageOfAddMinus.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/6.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit

class ResultPageOfAddMinus: UIViewController {
    
    var Matrix_Row = 0
    var Matrix_Line = 0
    var MatrixValue = [[Float]](repeating:[Float](repeating:0,count:4),count:4)
    @IBOutlet weak var result: UILabel!

    @IBAction func PageReturn(_ sender: AnyObject) {
    
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //result.text = String(test)
        result.text = String(Matrix_Row)+"行"+String(Matrix_Line)+"列"
        //var MatrixValue = [[Int]](repeating:[Int](repeating:0,count:Matrix_Line),count:Matrix_Row)
        for i in 0..<Matrix_Row{
            for j in 0..<Matrix_Line{
                
                let cgrect:CGRect = CGRect(x: 28+j*75, y: 200+i*50, width: 75, height: 50)
                let label :UILabel = UILabel(frame: cgrect)
                label.text = String(format : "%.3f",MatrixValue[i][j])
                
                self.view.addSubview(label)
            }
        }
        
        
        
        
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
