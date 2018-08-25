//
//  RJAPPModel.swift
//  XiaoYu_V3.0_Refactor
//
//  Created by RJ on 2018/8/9.
//  Copyright © 2018年 coollang. All rights reserved.
//

import UIKit
enum RJLanguage : Int {
    case SimpleChinese
    case English
    case Indonesia
}
class RJAPPModel: NSObject {
    
    /// 语言
    class func currentLanguage() -> RJLanguage {
        let appLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String];
        let langue       = appLanguages[0]
        if langue.contains("zh-Hans") {
            return RJLanguage.SimpleChinese
        }else if langue.contains("id") {
            return RJLanguage.Indonesia
        }
        return RJLanguage.English
    }
    class func statusBarHidden() -> Void {
        UIApplication.shared.setStatusBarHidden(true, with: UIStatusBarAnimation.none)
    }
}
