//
//  ViewController.swift
//  page controller demo
//
//  Created by Arjun-IOS on 13/07/19.
//  Copyright © 2019 Traning-IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    static var i = 0
    var arrImages = [UIImage]()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        arrImages = [#imageLiteral(resourceName: "c") , #imageLiteral(resourceName: "b") , #imageLiteral(resourceName: "e") , #imageLiteral(resourceName: "a") , #imageLiteral(resourceName: "d")]
        
        self.ConfigureSlides()
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = arrImages.count
        view.bringSubviewToFront(pageControl)
    }

    func ConfigureSlides(){
        for i in 0 ..< arrImages.count{
        let imageView = UIImageView()
        imageView.frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.addSubview(imageView)
        imageView.image = self.arrImages[i]
            
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(self.arrImages.count), height: view.frame.height)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        self.pageControl.currentPage = Int(pageIndex)
    }
    
    
    //MARK:function for autometic scrolling
    @objc func newStartScrolling()
    {
        if ViewController.i == arrImages.count {
            ViewController.i = 0
        }
        let x = CGFloat(ViewController.i) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
        ViewController.i += 1
    }
}

