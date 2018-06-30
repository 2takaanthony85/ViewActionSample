//
//  SampleView.swift
//  ViewActionSample
//
//  Created by 吉川昂広 on 2018/06/30.
//  Copyright © 2018年 takahiro yoshikawa. All rights reserved.
//

import UIKit

class SampleView: UIView {
    
    enum BehaviorMode {
        case None
        case Move
        case Change_UpRight
        case Change_UpLeft
        case Change_DownRight
        case Change_DownLeft
    }
    
    private var locationInitialTouch: CGPoint!
    
    let widthAspect: CGFloat = 255
    let heightAspect: CGFloat = 191
    
    private var max_x: CGFloat = 0
    private var max_y: CGFloat = 0
    
    private var behaviorMode = BehaviorMode.None

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.blue
        self.frame = CGRect(x: 20, y: 50, width: 255, height: 191)
        self.isUserInteractionEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func modeChange(x: CGFloat, y: CGFloat) {
        
        print("================================")
        print("bounds width : \(bounds.width)")
        print("bounds height : \(bounds.height)")
        
        if x < bounds.origin.x + 20 && y < bounds.origin.y + 20 {
            //左上
            behaviorMode = .Change_UpLeft
        } else if x < bounds.origin.x + 20 && y > bounds.height - 20 {
            //左下
            behaviorMode = .Change_DownLeft
        } else if x > bounds.width - 20 && y > bounds.height - 20 {
            //右下
            behaviorMode = .Change_DownRight
        } else if x > bounds.width - 20 && y <  bounds.origin.y + 20 {
            //右上
            behaviorMode = .Change_UpRight
        } else {
            //移動
            behaviorMode = .Move
        }
        
    }
    
    private func changeViewByBehaviorMode(x: CGFloat, y: CGFloat) {
        
        switch behaviorMode {
        case .Change_DownLeft:
            //左下
            
            print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
            print("前")
            print("frame.origin.x : \(frame.origin.x)")
            print("frame.origin.y : \(frame.origin.y)")
            print("frame.maxX : \(frame.maxX)")
            print("frame.maxY : \(frame.maxY)")
            print("location.x : \(x)")
            print("location.y : \(y)")
            print("frame.width : \(frame.width)")
            print("frame.height : \(frame.height)")
            
            
            frame = CGRect(origin: CGPoint(x: max_x - y * (widthAspect / heightAspect), y: frame.origin.y),
                           size: CGSize(width: y * (widthAspect / heightAspect), height: y))
            
            print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
            print("後")
            print("frame.origin.x : \(frame.origin.x)")
            print("frame.origin.y : \(frame.origin.y)")
            print("frame.maxX : \(frame.maxX)")
            print("frame.maxY : \(frame.maxY)")
            print("location.x : \(x)")
            print("location.y : \(y)")
            print("frame.width : \(frame.width)")
            print("frame.height : \(frame.height)")
            
            
        case .Change_DownRight:
            //右下
            print("##############################################")
            print("前")
            print("frame.origin.x : \(frame.origin.x)")
            print("frame.origin.y : \(frame.origin.y)")
            print("frame.maxX : \(frame.maxX)")
            print("frame.maxY : \(frame.maxY)")
            print("location.x : \(x)")
            print("location.y : \(y)")
            print("frame.width : \(frame.width)")
            print("frame.height : \(frame.height)")
            
            
            frame = CGRect(origin: frame.origin,
                           size: CGSize(width: x, height: x * (heightAspect / widthAspect)))
            
            print("###############################################")
            print("後")
            print("frame.origin.x : \(frame.origin.x)")
            print("frame.origin.y : \(frame.origin.y)")
            print("frame.maxX : \(frame.maxX)")
            print("frame.maxY : \(frame.maxY)")
            print("location.x : \(x)")
            print("location.y : \(y)")
            print("frame.width : \(frame.width)")
            print("frame.height : \(frame.height)")
            
            
        case .Change_UpLeft:
            //左上
            
            print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            print("前")
            print("frame.origin.x : \(frame.origin.x)")
            print("frame.origin.y : \(frame.origin.y)")
            print("frame.maxX : \(frame.maxX)")
            print("frame.maxY : \(frame.maxY)")
            print("location.x : \(x)")
            print("location.y : \(y)")
            print("frame.width : \(frame.width)")
            print("frame.height : \(frame.height)")

            frame = CGRect(origin: CGPoint(x: max_x - ((frame.height - y) * (widthAspect / heightAspect)), y: max_y - (frame.height - y)),
                           size: CGSize(width: (frame.height - y) * (widthAspect / heightAspect), height: frame.height - y))
            
            print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            print("後")
            print("frame.origin.x : \(frame.origin.x)")
            print("frame.origin.y : \(frame.origin.y)")
            print("frame.maxX : \(frame.maxX)")
            print("frame.maxY : \(frame.maxY)")
            print("location.x : \(x)")
            print("location.y : \(y)")
            print("frame.width : \(frame.width)")
            print("frame.height : \(frame.height)")
            
            
        case .Change_UpRight:
            //右上
            
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            print("前")
            print("frame.origin.x : \(frame.origin.x)")
            print("frame.origin.y : \(frame.origin.y)")
            print("frame.maxX : \(frame.maxX)")
            print("frame.maxY : \(frame.maxY)")
            print("location.x : \(x)")
            print("location.y : \(y)")
            print("frame.width : \(frame.width)")
            print("frame.height : \(frame.height)")
            print("max_y - x * (heightAspect / widthAspect) : \(max_y - x * (heightAspect / widthAspect))")
            
            
            frame = CGRect(origin: CGPoint(x: frame.origin.x, y: max_y - x * (heightAspect / widthAspect)),
                           size: CGSize(width: x, height: x * (heightAspect / widthAspect)))
            
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            print("後")
            print("frame.origin.x : \(frame.origin.x)")
            print("frame.origin.y : \(frame.origin.y)")
            print("frame.maxX : \(frame.maxX)")
            print("frame.maxY : \(frame.maxY)")
            print("location.x : \(x)")
            print("location.y : \(y)")
            print("frame.width : \(frame.width)")
            print("frame.height : \(frame.height)")
            
            
        default:
            //移動
            frame = frame.offsetBy(dx: x - locationInitialTouch.x, dy: y - locationInitialTouch.y)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            locationInitialTouch = location
            
            max_x = frame.maxX
            max_y = frame.maxY
            
            modeChange(x: location.x, y: location.y)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            changeViewByBehaviorMode(x: location.x, y: location.y)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            changeViewByBehaviorMode(x: location.x, y: location.y)
            //初期化
            behaviorMode = .None
            max_x = 0
            max_y = 0
        }
        
    }
}
