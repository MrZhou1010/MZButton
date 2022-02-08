# MZButton
按钮（图标+文字）

效果图：

![image](https://github.com/MrZhou1010/MZButton/raw/master/demo.png)

实现：

`注意: 使用自动布局的页面需要在layoutSubviews方法中设置`

方式一：分类

    for i in 0 ..< 4 {
        let btn1: UIButton = UIButton(type: .custom)
        btn1.frame = CGRect(x: 20.0, y: 100.0 + 100.0 * CGFloat(i), width: 120.0, height: 90.0)
        btn1.setTitle("微信", for: .normal)
        btn1.setTitleColor(UIColor.black, for: .normal)
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn1.setImage(UIImage(named: "icon_login_apple"), for: .normal)
        btn1.setImage(UIImage(named: "icon_login_apple"), for: .highlighted)
        btn1.layoutButtonEdgeInsets(with: MZButtonEdgeInsetsStyle(rawValue: i) ?? .top, imageTitleSpace: 10.0)
        btn1.layer.borderColor = UIColor.gray.cgColor
        btn1.layer.borderWidth = 1.0
        btn1.layer.masksToBounds = true
        self.view.addSubview(btn1)
    }

方式二：继承

    for i in 0 ..< 4 {
        let btn2: MZButton = MZButton(type: .custom)
        btn2.frame = CGRect(x: 200.0, y: 100.0 + 100.0 * CGFloat(i), width: 120.0, height: 90.0)
        btn2.setTitle("微信", for: .normal)
        btn2.setTitleColor(UIColor.black, for: .normal)
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn2.setImage(UIImage(named: "icon_login_apple"), for: .normal)
        btn2.setImage(UIImage(named: "icon_login_apple"), for: .highlighted)
        btn2.buttonEdgeInsetsType = MZButtonEdgeInsetsType(rawValue: i) ?? .top
        btn2.imageSize = CGSize(width: 40.0, height: 40.0)
        btn2.spacing = 10.0
        btn2.layer.borderColor = UIColor.lightGray.cgColor
        btn2.layer.borderWidth = 1.0
        btn2.layer.masksToBounds = true
        self.view.addSubview(btn2)
    }
