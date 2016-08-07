//
//  pagecontentviewcontroller.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/12.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit
class pagecontentviewcontroller:UIViewController{
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var HeadingLabel: UILabel!

    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var SubHeadingLabel: UILabel!
    
    @IBOutlet weak var nextScreen: UIButton!
    @IBOutlet weak var close: UIButton!
    
    @IBAction func close(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nextScreen(_ sender: AnyObject) {
        let pageViewController = self.parent as! PageViewController
        pageViewController.forward(index: index)
    }
    var index:Int = 0
    var heading:String = ""
    var imageFile:String = ""
    var subHeading : String = ""
    
    override func viewDidLoad() {
        self.close.layer.cornerRadius = 5
        if(index == 2){
            self.close.isHidden = false
            self.nextScreen.isHidden = true
        }
        else{
            self.close.isHidden = true
            self.nextScreen.isHidden = false
        }
        pageControl.currentPage = index
        HeadingLabel.text = heading
        SubHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named:imageFile)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    
