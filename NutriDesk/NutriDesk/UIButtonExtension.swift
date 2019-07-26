//
//  UIButtonExtension.swift
//  NutriDesk
//
//  Created by Julia Santos on 25/07/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func pulsate (){
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.duration = 0.1
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.autoreverses = true
//        pulse.repeatCount = 1
        pulse.initialVelocity = 0.2
//        pulse.damping = 0.5
        
        layer.add(pulse, forKey: nil)
    }
}
