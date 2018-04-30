//
//  ViewController.swift
//  MyFingerMOve
//
//  Created by KaiChieh on 2018/4/30.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swiptAction(_:)))
        swipe.direction = .right
        self.view.addGestureRecognizer(swipe)
        imgStar.alpha = 0
    }
    var touchStartPostion:CGPoint!
    var touchEndPosition:CGPoint!

    @IBOutlet weak var imgStar: UIImageView!
    @objc func swiptAction(_ sender: UISwipeGestureRecognizer){

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            touchStartPostion = touch.location(in: self.view)
            let centerPosition = CGPoint(x: touchStartPostion.x - imgStar.frame.size.width/2, y: touchStartPostion.y - imgStar.frame.size.height/2)
            imgStar.frame.origin = centerPosition
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            touchStartPostion = touch.location(in: self.view)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let touch = touches.first {
            touchEndPosition = touch.location(in: self.view)
            UIView.animate(withDuration: 0.25, animations: {
                self.imgStar.alpha = 1
            }) { (finished) in
                UIView.animate(withDuration: 0.25, animations: {
                    self.imgStar.alpha = 0
                })
            }
        }
    }

}

