//
//  RJBaseViewController.swift
//  swiftTest
//
//  Created by RJ on 2018/7/16.
//  Copyright © 2018年 RJ. All rights reserved.
//

import UIKit

let VCBackGorundColor = UIColor(patternImage: UIImage(named: "sport_background")!)


public enum RJNavBarItemLocaltion :Int {
    case left_first
    case left_second
    case right_first
    case right_second
}

public class RJBaseViewController: UIViewController {
    public var navBarHidden:Bool {
        get{
            return navigationController?.navigationBar.isHidden ?? false
        }
        set(navBarHidden){
            navigationController?.navigationBar.isHidden = navBarHidden
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        addNavBarItemBtn(.left_first, nil, "nav_back", self, #selector(exitViewController), .touchUpInside)
        configureNavigation()
        view.backgroundColor = VCBackGorundColor
    }
    public func addSubview(_ subview:UIView) -> Void {
        view.addSubview(subview);
    }
    
    public func configureNavigation() {
        
    }
    
    public func navBarTitle(_ title:String? ,_ color:UIColor = .white , _ font:UIFont = RJFontMedium(16)) -> Void {
        guard let _ = self.navigationController else { return  }
        let lable = UILabel()
        lable.text = title
        lable.textColor = color
        lable.font      = font
        
        navigationItem.titleView = lable
    }
    public func addNavBarItemBtn(_ localtion:RJNavBarItemLocaltion,_ title:String?,_ image:String?,_ target:Any?,_ action:Selector, _ controlEvents:UIControlEvents) -> Void {
        guard let _ = self.navigationController else { return  }
        let btn = UIButton(type: .custom)
        btn.addTarget(target, action: action, for: controlEvents)
        if title?.count != nil {
            btn.setTitle(title!, for: .normal)
        }else{
            if image?.count != nil {
                btn.setImage(UIImage(named: image!), for: .normal)
            }
        }
        btn.sizeToFit()
        let item = UIBarButtonItem(customView: btn)
        //        navigationItem.rightBarButtonItem = item;
        switch localtion {
        case .left_first:
            var leftBarButtonItems = navigationItem.leftBarButtonItems != nil ? navigationItem.leftBarButtonItems! : [UIBarButtonItem]()
            leftBarButtonItems.insert(item, at: 0)
            navigationItem.leftBarButtonItems = leftBarButtonItems
        case .left_second:
            var leftBarButtonItems = navigationItem.leftBarButtonItems != nil ? navigationItem.leftBarButtonItems! : [UIBarButtonItem]()
            leftBarButtonItems.insert(item, at: 1)
            navigationItem.leftBarButtonItems = leftBarButtonItems
        case .right_first:
            var rightBarButtonItems = navigationItem.rightBarButtonItems != nil ? navigationItem.rightBarButtonItems! : [UIBarButtonItem]()
            rightBarButtonItems.insert(item, at: 0)
            navigationItem.rightBarButtonItems = rightBarButtonItems
        case .right_second:
            var rightBarButtonItems = navigationItem.rightBarButtonItems != nil ? navigationItem.rightBarButtonItems! : [UIBarButtonItem]()
            rightBarButtonItems.insert(item, at: 1)
            navigationItem.rightBarButtonItems = rightBarButtonItems
        }
    }
    @objc
    public func exitViewController() -> Void {
        if self.navigationController != nil {
            navigationController?.popViewController(animated: true)
        }else{
            dismiss(animated: true, completion: nil)
        }
    }
}
