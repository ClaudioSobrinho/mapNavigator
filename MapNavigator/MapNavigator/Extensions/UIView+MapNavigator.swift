//
//  UIView+MapNavigator.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/28/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import UIKit

public extension UIView {
    
    public var width: CGFloat {
        get { return self.frame.size.width }
        set { self.frame.size.width = newValue}
    }
    
    public var height: CGFloat {
        get { return self.frame.size.height }
        set { self.frame.size.height = newValue}
    }
    
    public var top: CGFloat {
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue}
    }
    
    public var left: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue}
    }
}
