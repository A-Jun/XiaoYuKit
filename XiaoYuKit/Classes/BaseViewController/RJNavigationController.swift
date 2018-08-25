//
//  RJNavigationController.swift
//  swiftTest
//
//  Created by RJ on 2018/7/16.
//  Copyright © 2018年 RJ. All rights reserved.
//

import UIKit
let navBarTinColor    = UIColor(0x04191e)

public class RJNavigationController: UINavigationController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = navBarTinColor
    }

}
