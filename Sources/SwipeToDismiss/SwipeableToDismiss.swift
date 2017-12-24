//
//  SwipeableToDismiss.swift
//  SwipeTransition
//
//  Created by Tatsuya Tanaka on 20171223.
//  Copyright © 2017年 tattn. All rights reserved.
//

import UIKit

public protocol SwipeableToDismiss: class {
    var swipeToDismiss: SwipeToDismissController? { get set }
}

public extension SwipeableToDismiss where Self: UIViewController {
    public var swipeToDismiss: SwipeToDismissController? {
        get {
            return objc_getAssociatedObject(self, &AssocKey.swipeToDismiss) as? SwipeToDismissController
        }
        set {
            objc_setAssociatedObject(self, &AssocKey.swipeToDismiss, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    public func configureSwipeToDismiss(scrollView: UIScrollView? = nil, navigationBar: UIView? = nil) {
        swipeToDismiss = SwipeToDismissController(view: view)
        swipeToDismiss?.scrollView = scrollView
        swipeToDismiss?.navigationBar = navigationBar
    }
}

public extension UINavigationController {
    public var swipeToDismiss: SwipeToDismissController? {
        get {
            return objc_getAssociatedObject(self, &AssocKey.swipeToDismiss) as? SwipeToDismissController
        }
        set {
            objc_setAssociatedObject(self, &AssocKey.swipeToDismiss, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
