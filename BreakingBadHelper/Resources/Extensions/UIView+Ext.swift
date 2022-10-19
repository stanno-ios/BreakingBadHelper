//
//  UIView+Ext.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/19/22.
//

import UIKit

extension UIView {
    func addOverlay(color: UIColor = .black, alpha: CGFloat = 0.4) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
}
