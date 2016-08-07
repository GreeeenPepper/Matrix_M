//
//  PageViewController.swift
//  A Matrix Cal no.2
//
//  Created by WiseY on 16/7/12.
//  Copyright © 2016年 WiseY. All rights reserved.
//
//
import UIKit
class PageViewController:UIPageViewController,UIPageViewControllerDataSource{
    var pageHeadings = ["是时候锻炼你的记忆力了！","我们提供了两种模式","快来挑战你的极限吧！"]
    var pageSubHeadings = ["","",""]
    var pageImages = ["INtro1","INtro2","INtro3"]
    
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! pagecontentviewcontroller).index
        index += 1
        return self.viewControllerAtIndex(index: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! pagecontentviewcontroller).index
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    func viewControllerAtIndex(index:Int) -> pagecontentviewcontroller?{
        if(index == NSNotFound || index<0 || index>=self.pageHeadings.count){
            return nil
        }
        if let pagecontentviewcontroller = storyboard?.instantiateViewController(withIdentifier: "pagecontentviewcontroller") as? pagecontentviewcontroller{
            pagecontentviewcontroller.imageFile = pageImages[index]
            pagecontentviewcontroller.heading = pageHeadings[index]
            pagecontentviewcontroller.subHeading = pageSubHeadings[index]
            pagecontentviewcontroller.index = index
            
            return pagecontentviewcontroller
        }
        return nil
    }
    func forward(index:Int){
        if let nextViewController = self.viewControllerAtIndex(index: index+1){
            setViewControllers([nextViewController], direction:.forward, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        dataSource = self
        if let startingViewController = self.viewControllerAtIndex(index: 0){
            setViewControllers([startingViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        }
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    
    
    
    

