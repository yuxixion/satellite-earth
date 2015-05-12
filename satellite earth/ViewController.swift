//
//  ViewController.swift
//  satellite earth
//
//  Created by yuxi xiong on 5/12/15.
//  Copyright (c) 2015 yuxi xiong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var speedController: UISlider!
    @IBOutlet weak var distanceController: UISlider!
    
    @IBOutlet weak var earthImageView: UIImageView!
    
    var rotationSpeed:Double = 10.0
    var distanceFromEarth = CGFloat(100.0)
    
    var satellite = CALayer()
    var anim = CAKeyframeAnimation(keyPath: "position")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        earthImageView.image = UIImage(named: "earth")
        self.view.addSubview(earthImageView)
        updateState()
        
        
    }
    
    func updateState(){
        var screenbound:CGRect = UIScreen.mainScreen().bounds
        var screensize = screenbound.size
        var screenheight = screensize.height
        var screenwidth = screensize.width
        let earthCenter = CGPoint(x: screenwidth/2, y: screenheight/2)
        let circlePath : UIBezierPath = UIBezierPath(arcCenter: earthCenter, radius: distanceFromEarth, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        satellite.bounds = CGRectMake(0, 0, 30, 30)
        satellite.contents = UIImage(named: "satellite")?.CGImage
        self.view.layer.addSublayer(satellite)
        anim.path = circlePath.CGPath
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = HUGE
        anim.duration = rotationSpeed
        satellite.addAnimation(anim, forKey: "rotation")
    }
    
 
    @IBAction func speedChange(sender: UISlider) {
        rotationSpeed = Double(sender.value)
    }
    
    
    @IBAction func distanceChange(sender: UISlider) {
        
        distanceFromEarth = CGFloat(sender.value)
        updateState()
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

