//
//  TraditionalSelectDifficulty.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/8.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit

class traditional_select_difficulty : UIViewController{
    
    var difficulty_Choose = 0
    @IBAction func GoBack(_ sender: AnyObject) {
        self.dismiss(animated:false,completion: nil)
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
