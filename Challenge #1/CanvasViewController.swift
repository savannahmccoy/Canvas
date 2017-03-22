//
//  CanvasViewController.swift
//  Challenge #1
//
//  Created by Savannah McCoy on 6/30/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!
    
    
    @IBOutlet weak var trayView: UIView!
    @IBAction func didPanTray(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        
        var velocity = sender.velocityInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            trayOriginalCenter = trayView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
           // if velocity.y > 0
           // if velocity.y < 0
            
            
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
            self.trayView.center = velocity.y < 0 ? self.trayUp : self.trayDown
            }, completion: { (Bool) -> Void in
            })
        
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trayDownOffset = 170
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanFace(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(CanvasViewController.selectedPlacedFace(_:)))
        
        if sender.state == UIGestureRecognizerState.Began {
            
            
            let imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            newlyCreatedFace.transform = CGAffineTransformMakeScale(2, 2)
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: {
                () -> Void in
                
                
                self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1,1)
                }, completion: { (Bool) -> Void in
            })
            
            newlyCreatedFace.userInteractionEnabled = true
            newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
        }
    }
    
    func doubleTapped (sender: UITapGestureRecognizer){
    
        
          if sender.numberOfTapsRequired == 2  {
           
            newlyCreatedFace = sender.view as! UIImageView
            newlyCreatedFace.removeFromSuperview()
        }

        
    }
    
    
        
        
        func selectedPlacedFace (sender: UIPanGestureRecognizer){
            
            let translation = sender.translationInView(view)
            
            if sender.state == UIGestureRecognizerState.Began {
                
                newlyCreatedFace = sender.view as! UIImageView
                newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
                newlyCreatedFace.transform = CGAffineTransformMakeScale(2, 2)
                
            } else if sender.state == UIGestureRecognizerState.Changed {
                
                newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
                
            } else if sender.state == UIGestureRecognizerState.Ended {
                
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: {
                    () -> Void in
                    
                    
                    self.newlyCreatedFace.transform = CGAffineTransformMakeScale(1,1)
                    }, completion: { (Bool) -> Void in
                })
                
              
                
            
        
        }
        
        
        

        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
