//
//  MZButton.swift
//  MZButton
//
//  Created by Mr.Z on 2019/11/29.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import UIKit

enum MZButtonEdgeInsetsType: Int {
    case top // image在上，label在下
    case left // image在左，label在右
    case bottom // image在下，label在上
    case right // image在右，label在左
}

class MZButton: UIButton {
    /// 图片大小,默认为(30,30)
    public var imageSize: CGSize = CGSize(width: 30, height: 30) {
        didSet {
            self.layoutButtonWithEdgeInsets(type: self.buttonEdgeInsetsType)
        }
    }
    /// 间隔,默认为0.0
    public var spacing: CGFloat = 0.0 {
        didSet {
            self.layoutButtonWithEdgeInsets(type: self.buttonEdgeInsetsType)
        }
    }
    /// 按钮布局的类型,默认为top
    var buttonEdgeInsetsType: MZButtonEdgeInsetsType = .top {
        didSet {
            self.layoutButtonWithEdgeInsets(type: buttonEdgeInsetsType)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel?.sizeToFit()
        self.imageView?.contentMode = .scaleAspectFit
        self.layoutButtonWithEdgeInsets(type: self.buttonEdgeInsetsType)
    }
    
    private func layoutButtonWithEdgeInsets(type: MZButtonEdgeInsetsType) {
        if self.titleLabel?.text == nil || self.imageView?.image == nil {
            return
        }
        switch type {
        case .top:
            self.titleLabel?.textAlignment = .center
            let labelHeight = self.titleLabel?.text?.getSizeWidthComment(font: (self.titleLabel?.font)!, size: CGSize(width: self.frame.width, height: CGFloat(MAXFLOAT))).height
            let marginY = (self.frame.height - self.imageSize.height - self.spacing - labelHeight!) * 0.5
            self.imageView?.frame = CGRect(x: (self.frame.width - self.imageSize.width) * 0.5, y: marginY, width: self.imageSize.width, height: self.imageSize.height)
            self.titleLabel?.frame = CGRect(x: 0, y: (self.imageView?.frame.maxY)! + self.spacing, width: self.frame.width, height: labelHeight!)
        case .bottom:
            self.titleLabel?.textAlignment = .center
            let labelHeight = self.titleLabel?.text?.getSizeWidthComment(font: (self.titleLabel?.font)!, size: CGSize(width: self.frame.width, height: CGFloat(MAXFLOAT))).height
            let marginY = (self.frame.height - self.imageSize.height - self.spacing - labelHeight!) * 0.5
            self.titleLabel?.frame = CGRect(x: 0, y: marginY, width: self.frame.width, height: labelHeight!)
            self.imageView?.frame = CGRect(x: (self.frame.width - self.imageSize.width) * 0.5, y: (self.titleLabel?.frame.maxY)! + self.spacing, width: self.imageSize.width, height: self.imageSize.height)
        case .left:
            let labelWidth = self.titleLabel?.text?.getSizeWidthComment(font: (self.titleLabel?.font)!, size: CGSize(width: CGFloat(MAXFLOAT), height: self.frame.height)).width
            let marginX = (self.frame.width - self.imageSize.width - self.spacing - labelWidth!) * 0.5
            self.imageView?.frame = CGRect(x: marginX, y: (self.frame.height - self.imageSize.height) * 0.5, width: self.imageSize.width, height: self.imageSize.height)
            self.titleLabel?.frame = CGRect(x: (self.imageView?.frame.maxX)! + self.spacing, y: 0, width: labelWidth!, height: self.frame.height)
        case .right:
            let labelWidth = self.titleLabel?.text?.getSizeWidthComment(font: (self.titleLabel?.font)!, size: CGSize(width: CGFloat(MAXFLOAT), height: self.frame.height)).width
            let marginX = (self.frame.width - self.imageSize.width - self.spacing - labelWidth!) * 0.5
            self.titleLabel?.frame = CGRect(x: marginX, y: 0, width: labelWidth!, height: self.frame.height)
            self.imageView?.frame = CGRect(x: (self.titleLabel?.frame.maxX)! + self.spacing, y: (self.frame.height - self.imageSize.height) * 0.5, width: self.imageSize.width, height: self.imageSize.height)
        }
    }
}

extension String {
    public func getSizeWidthComment(font: UIFont, size: CGSize) -> CGSize {
        let rect = self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return rect.size
    }
}
