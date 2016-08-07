//
//  MatrixM_ModeSelect.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/8.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import UIKit
class localnotification:NSObject{
    class func addNotification() {
        
        
        let localNoti = UILocalNotification()
        
        
        //localNoti.fireDate = getFireDate(hourOfDay: 12) as Date
        localNoti.fireDate = NSDate().addingTimeInterval(10) as Date
        
        
        localNoti.repeatInterval = Calendar.Unit.day
        localNoti.timeZone = TimeZone.default()
        localNoti.alertBody = "中午到了！排队打饭的时候可以锻炼一下记忆力哦"
        localNoti.alertAction = "打开Matrix M"
        UIApplication.shared().scheduleLocalNotification(localNoti)
    }   
}




class MatrixM_GameSelect : UIViewController{
    @IBOutlet weak var traditionButton: UIButton!
    @IBOutlet weak var sequenceButton: UIButton!
    @IBOutlet weak var AlertEveryDay: UIButton!
    @IBAction func makelocalnotification(_ sender: AnyObject) {
        let locals = UIApplication.shared().scheduledLocalNotifications
        if(Int((locals?.count)!) == 0){
            print("we don't have then we add")
        localnotification.addNotification()
        self.AlertEveryDay.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.AlertEveryDay.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
            self.AlertEveryDay.setImage(#imageLiteral(resourceName: "MatrixM_ModeSelect_Text1"), for: [])
        }
        else{
            print("we have,then we clear")
            UIApplication.shared().cancelAllLocalNotifications()
            self.AlertEveryDay.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
            self.AlertEveryDay.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.AlertEveryDay.setImage(#imageLiteral(resourceName: "MatrixM_ModeSelect_Text2"), for: [])
        }
    }
    override func viewDidLoad() {
        self.traditionButton.layer.cornerRadius = 8
        self.traditionButton.layer.masksToBounds = true
        self.sequenceButton.layer.cornerRadius = 8
        self.sequenceButton.layer.masksToBounds = true
        self.AlertEveryDay.layer.cornerRadius = 8
        let locals = UIApplication.shared().scheduledLocalNotifications
        print(locals)
        print(Int((locals?.count)!))
        if(Int((locals?.count)!) == 0){
            self.AlertEveryDay.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
            self.AlertEveryDay.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.AlertEveryDay.setImage(#imageLiteral(resourceName: "MatrixM_ModeSelect_Text2"), for: [])
        }
        else{
            self.AlertEveryDay.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
            self.AlertEveryDay.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.AlertEveryDay.setImage(#imageLiteral(resourceName: "MatrixM_ModeSelect_Text1"), for: [])
        }
        if let PageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController")as?PageViewController{
            self.present(PageViewController,animated: true,completion:nil)
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}





