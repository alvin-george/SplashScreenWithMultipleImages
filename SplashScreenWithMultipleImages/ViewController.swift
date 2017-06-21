//
//  ViewController.swift
//  SplashScreenWithMultipleImages
//
//  Created by apple on 21/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animationContainerView: UIView!
    @IBOutlet weak var splashImageView: UIImageView!
    
    var imageNameArray:[String]!
    var animationImagesArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateArray()
        addAnimatedView()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        addAnimatedView()
        loadImagesAnimated()
    }
    func addAnimatedView()
    {
        let view = AnimatedEqualizerView(containerView: animationContainerView)
        self.animationContainerView.backgroundColor = UIColor.clear
        self.animationContainerView.addSubview(view)
        view.animate()
        
    }
    func loadImagesAnimated()
    {
        animationContainerView.isHidden =  false
        
        
        splashImageView.animationImages = animationImagesArray
        splashImageView.animationDuration = 5.0
        splashImageView.animationRepeatCount =  1
        splashImageView.startAnimating()
        
        perform(#selector(ViewController.stopAnimationOfImageview), with: nil, afterDelay: 5.0)
        
        
    }
    func stopAnimationOfImageview()
    {
        
        splashImageView.stopAnimating()
        animationContainerView.isHidden =  true
        
        let alert = UIAlertController(title: "Over!", message: "Now navigate to Main View", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func updateArray()
    {
        imageNameArray = ["first_image","second_image","third_image","fourth_image","fifth_image"]
        
        for i in 0...imageNameArray.count-1 {
            
            animationImagesArray.append(UIImage(named: imageNameArray[i])!)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

