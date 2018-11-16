//
//  CustomScrollView.swift
//  XLPagerTabStrip
//
//  Created by Stanley on 2018/11/16.
//

import UIKit

class CustomScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension CustomScrollView: UIGestureRecognizerDelegate {

    // 解决侧滑手势冲突
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.contentOffset.x <= 0 {
            if let delegate = otherGestureRecognizer.delegate {
                if String(describing: type(of: delegate)) == "_FDFullscreenPopGestureRecognizerDelegate" {
                    return true
                }
            }
        }
        return false
    }
    
}
