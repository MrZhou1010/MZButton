# MZButton
按钮（图标+文字）

效果图：

![image](https://github.com/MrZhou1010/MZButton/raw/master/demo.png)

实现：

`注意: 使用自动布局的页面需要在layoutSubviews方法中设置`

方式一：分类

    for i in 0 ..< 4 {
      let button1: UIButton = UIButton(type: .custom)
      button1.frame = CGRect(x: 20, y: 100 + 100 * i, width: 120, height: 80)
      button1.setTitle("微信", for: .normal)
      button1.setTitleColor(UIColor.black, for: .normal)
      button1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
      button1.setImage(UIImage(named: "icon_login_apple"), for: .normal)
      button1.setImage(UIImage(named: "icon_login_apple"), for: .highlighted)
      button1.layoutButtonWithEdgeInsets(style: MZButtonEdgeInsetsStyle(rawValue: i) ?? .top, imageTitleSpace: 10)
      button1.layer.borderColor = UIColor.gray.cgColor
      button1.layer.borderWidth = 1
      button1.layer.masksToBounds = true
      self.view.addSubview(button1)
    }

方式二：继承

    for i in 0 ..< 4 {
      let button2: MZButton = MZButton(type: .custom)
      button2.frame = CGRect(x: 200, y: 100 + 100 * i, width: 120, height: 80)
      button2.setTitle("微信", for: .normal)
      button2.setTitleColor(UIColor.black, for: .normal)
      button2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
      button2.setImage(UIImage(named: "icon_login_apple"), for: .normal)
      button2.setImage(UIImage(named: "icon_login_apple"), for: .highlighted)
      button2.buttonEdgeInsetsType = MZButtonEdgeInsetsType(rawValue: i) ?? .top
      button2.imageSize = CGSize(width: 40, height: 40)
      button2.spacing = 10
      button2.layer.borderColor = UIColor.lightGray.cgColor
      button2.layer.borderWidth = 1
      button2.layer.masksToBounds = true
      self.view.addSubview(button2)
    }
