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
        let imageWidth: CGFloat = self.imageView?.frame.size.width ?? 0.0
        let imageHeight: CGFloat = self.imageView?.frame.size.height ?? 0.0
        let titleWidth: CGFloat = self.titleLabel?.intrinsicContentSize.width ?? 0.0
        let titleHeight: CGFloat = self.titleLabel?.intrinsicContentSize.height ?? 0.0
        // 2.声明全局的imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets: UIEdgeInsets = .zero
        var titleEdgeInsets: UIEdgeInsets = .zero
        // 3.根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -titleHeight - imageTitleSpace * 0.5, left: 0, bottom: 0, right: -titleWidth)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight - imageTitleSpace * 0.5, right: 0)
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -imageTitleSpace * 0.5, bottom: 0, right: imageTitleSpace * 0.5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleSpace * 0.5, bottom: 0, right: imageTitleSpace * 0.5)
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -titleHeight - imageTitleSpace * 0.5, right: -titleWidth)
            titleEdgeInsets = UIEdgeInsets(top: -imageHeight - imageTitleSpace * 0.5, left: -imageWidth, bottom: 0, right: 0)
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: titleWidth + imageTitleSpace * 0.5, bottom: 0, right: -titleWidth - imageTitleSpace * 0.5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth - imageTitleSpace * 0.5, bottom: 0, right: imageWidth + imageTitleSpace * 0.5)
        }
        // 4.赋值
        self.imageEdgeInsets = imageEdgeInsets
        self.titleEdgeInsets = titleEdgeInsets
    }
}
