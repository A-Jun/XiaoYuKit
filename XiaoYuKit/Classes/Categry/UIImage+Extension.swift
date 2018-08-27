//
//  UIImage+Extension.swift
//  Pods-XiaoYuKit_Example
//
//  Created by RJ on 2018/8/27.
//

import UIKit

public extension UIImage {
    
    public class func currentBoudle(_ name:String?) -> UIImage?{
        let curBundle = Bundle(for: UIImage.self)
        let curBundleName = curBundle.infoDictionary![kCFBundleNameKey! as String]
        let curBundleDirectory = String(format: "%@.boudle", curBundleName as! CVarArg)
        let path = curBundle.path(forResource: name, ofType: nil, inDirectory: curBundleDirectory)
        guard let imagePath = path else { return nil }
        return  UIImage(contentsOfFile: imagePath)
    }
   
}
