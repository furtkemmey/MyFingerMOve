//
//  MoveableImageView.swift
//  MyFingerMOve
//
//  Created by KaiChieh on 2018/4/30.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class MoveableImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let deltaX = touch.location(in: self).x - touch.previousLocation(in: self).x
            let deltaY = touch.location(in: self).y - touch.previousLocation(in: self).y

//            self.frame.origin.x = self.frame.origin.x + deltaX
//            self.frame.origin.y = self.frame.origin.y + deltaY
             // 用矩陣轉換
            self.transform =  self.transform.translatedBy(x: deltaX, y: deltaY)
        }
    }

}
