//
//  MZButton.swift
//  MZButton
//
//  Created by Mr.Z on 2019/11/29.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

public enum MZButtonEdgeInsetsType: Int {
    case top    // image在上,label在下
    case left   // image在左,label在右
    case bottom // image在下,label在上
    case right  // image在右,label在左
}

class MZButton: UIButton {
    
    /// 图片大小,默认为(30.0, 30.0)
    public var imageSize: CGSize = CGSize(width: 30.0, height: 30.0) {
        didSet {
            self.layoutButtonEdgeInsets(with: self.buttonEdgeInsetsType)
        }
    }
    
    /// 间隔,默认为0.0
    public var spacing: CGFloat = 0.0 {
        didSet {
            self.layoutButtonEdgeInsets(with: self.buttonEdgeInsetsType)
        }
    }
    
    /// 按钮布局的类型,默认为top
    public var buttonEdgeInsetsType: MZButtonEdgeInsetsType = .top {
        didSet {
            self.layoutButtonEdgeInsets(with: self.buttonEdgeInsetsType)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel?.sizeToFit()
        self.imageView?.contentMode = .scaleAspectFit
        self.layoutButtonEdgeInsets(with: self.buttonEdgeInsetsType)
    }
    
    private func layoutButtonEdgeInsets(with type: MZButtonEdgeInsetsType) {
        if self.titleLabel?.text == nil || self.imageView?.image == nil {
            return
        }
        switch type {
        case .top:
            self.titleLabel?.textAlignment = .center
            let labelHeight = self.getSizeWithComment(text: self.titleLabel?.text ?? "", font: self.titleLabel?.font ?? UIFont.systemFont(ofSize: 15), size: CGSize(width: self.frame.width, height: CGFloat(MAXFLOAT))).height
            let marginY = (self.frame.height - self.imageSize.height - self.spacing - labelHeight) * 0.5
            self.imageView?.frame = CGRect(x: (self.frame.width - self.imageSize.width) * 0.5, y: marginY, width: self.imageSize.width, height: self.imageSize.height)
            self.titleLabel?.frame = CGRect(x: 0, y: marginY + self.imageSize.height + self.spacing, width: self.frame.width, height: labelHeight)
        case .bottom:
            self.titleLabel?.textAlignment = .center
            let labelHeight = self.getSizeWithComment(text: self.titleLabel?.text ?? "", font: self.titleLabel?.font ?? UIFont.systemFont(ofSize: 15), size: CGSize(width: self.frame.width, height: CGFloat(MAXFLOAT))).height
            let marginY = (self.frame.height - self.imageSize.height - self.spacing - labelHeight) * 0.5
            self.titleLabel?.frame = CGRect(x: 0, y: marginY, width: self.frame.width, height: labelHeight)
            self.imageView?.frame = CGRect(x: (self.frame.width - self.imageSize.width) * 0.5, y: marginY + labelHeight + self.spacing, width: self.imageSize.width, height: self.imageSize.height)
        case .left:
            let labelWidth = self.getSizeWithComment(text: self.titleLabel?.text ?? "", font: self.titleLabel?.font ?? UIFont.systemFont(ofSize: 15), size:CGSize(width: CGFloat(MAXFLOAT), height: self.frame.height)).width
            let marginX = (self.frame.width - self.imageSize.width - self.spacing - labelWidth) * 0.5
            self.imageView?.frame = CGRect(x: marginX, y: (self.frame.height - self.imageSize.height) * 0.5, width: self.imageSize.width, height: self.imageSize.height)
            self.titleLabel?.frame = CGRect(x: marginX + self.imageSize.width + self.spacing, y: 0, width: labelWidth, height: self.frame.height)
        case .right:
            let labelWidth = self.getSizeWithComment(text: self.titleLabel?.text ?? "", font: self.titleLabel?.font ?? UIFont.systemFont(ofSize: 15), size:CGSize(width: CGFloat(MAXFLOAT), height: self.frame.height)).width
            let marginX = (self.frame.width - self.imageSize.width - self.spacing - labelWidth) * 0.5
            self.titleLabel?.frame = CGRect(x: marginX, y: 0, width: labelWidth, height: self.frame.height)
            self.imageView?.frame = CGRect(x: marginX + labelWidth + self.spacing, y: (self.frame.height - self.imageSize.height) * 0.5, width: self.imageSize.width, height: self.imageSize.height)
        }
    }
    
    private func getSizeWithComment(text: String, font: UIFont, size: CGSize) -> CGSize {
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return rect.size
    }
}
