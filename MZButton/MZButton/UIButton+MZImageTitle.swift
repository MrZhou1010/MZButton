//
//  UIButton+MZImageTitle.swift
//  MZButton
//
//  Created by Mr.Z on 2019/11/29.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import Foundation
import UIKit

public enum MZButtonEdgeInsetsStyle: Int {
    case top    // image在上,label在下
    case left   // image在左,label在右
    case bottom // image在下,label在上
    case right  // image在右,label在左
}

extension UIButton {
    
    /// 图标+文字按钮布局
    /// - Parameters:
    ///   - style: 按钮图标+文字样式
    ///   - imageTitleSpace: 按钮图标+文字间隔
    public func layoutButtonWithEdgeInsets(style: MZButtonEdgeInsetsStyle, imageTitleSpace: CGFloat) {
        // 1.得到imageView和titleLabel的宽、高
        let imageWith: CGFloat = self.imageView?.frame.size.width ?? 0.0
        let imageHeight: CGFloat = self.imageView?.frame.size.height ?? 0.0
        let labelWidth: CGFloat = self.titleLabel?.intrinsicContentSize.width ?? 0.0
        let labelHeight: CGFloat = self.titleLabel?.intrinsicContentSize.height ?? 0.0
        // 2.声明全局的imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets: UIEdgeInsets = .zero
        var labelEdgeInsets: UIEdgeInsets = .zero
        // 3.根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - imageTitleSpace * 0.5, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight - imageTitleSpace * 0.5, right: 0)
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -imageTitleSpace * 0.5, bottom: 0, right: imageTitleSpace * 0.5)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleSpace * 0.5, bottom: 0, right: imageTitleSpace * 0.5)
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight - imageTitleSpace * 0.5, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight - imageTitleSpace * 0.5, left: -imageWith, bottom: 0, right: 0)
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + imageTitleSpace * 0.5, bottom: 0, right: -labelWidth - imageTitleSpace * 0.5)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith - imageTitleSpace * 0.5, bottom: 0, right: imageWith + imageTitleSpace * 0.5)
        }
        // 4.赋值
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
}
