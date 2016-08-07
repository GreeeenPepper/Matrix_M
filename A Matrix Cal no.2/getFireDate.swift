//
//  getFireDate.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/12.
//  Copyright © 2016年 WiseY. All rights reserved.
//

import Foundation
import UIKit

func getFireDate(hourOfDay:Float) -> NSDate {
    let pushTime:Float = hourOfDay * 60 * 60
    let date = NSDate()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH,mm,ss"
    let strDate = dateFormatter.string(from: date as Date)
    let dateArr = strDate.components(separatedBy: ",")
    let hour = ((dateArr[0]) as NSString).floatValue*60*60
    let minute = ((dateArr[1]) as NSString).floatValue * 60
    let second = ((dateArr[2]) as NSString).floatValue
    var newPushTime = Float()
    if hour>pushTime{
        newPushTime = 24*60*60 - (hour+minute+second)+pushTime
    }
    else{
        newPushTime = pushTime - (hour + minute + second)
    }
    return NSDate(timeIntervalSinceNow:TimeInterval(newPushTime))
}
