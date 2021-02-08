//
//  ViewController.swift
//  SampleApp
//
//  Created by shinichiro kudo on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    
    let colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpGradation()
        
        setContentView()
        
    }
    
    // グラデーション
    func setUpGradation() {
        let gradientLeyer = CAGradientLayer()
        // CGRectでフレームそのものの座標を指定。xyは左上の位置。widthとheightはフレームのサイズ。
        gradientLeyer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2)
        gradientLeyer.colors = [colors.bluePurple.cgColor, colors.blue.cgColor]
        gradientLeyer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLeyer.endPoint = CGPoint.init(x: 1, y: 1)
        view.layer.insertSublayer(gradientLeyer, at: 0)
    }
    
    // ①のview
    func setContentView() {
        let contentView = UIView()
        contentView.frame.size = CGSize(width: view.frame.size.width, height: 340)
        contentView.center = CGPoint(x: view.center.x, y: view.center.y)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 30
        // shadowOffsetは影の方向。widthで右に、heightで下にいく。
        contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentView.layer.shadowColor = UIColor.gray.cgColor
        // shadowOpacityは透明度。0~1
        contentView.layer.shadowOpacity = 0.5
        view.addSubview(contentView)
        // contentViewの背景色。上半分はレイヤー指定されており、ここでは下半分に色をつけていることになる。
        view.backgroundColor = .systemGray6
        
        let labelFont = UIFont.systemFont(ofSize: 15, weight: .heavy)
        let size = CGSize(width: 150, height: 50)
        let color = colors.bluePurple
        let leftX = view.frame.size.width * 0.33
        let rightX = view.frame.size.width * 0.80
        setLabel("Covid in Japan",
                 size: CGSize(width: 180, height: 35),
                 centerX: view.center.x - 20,
                 y: -60,
                 font: .systemFont(ofSize: 25, weight: .heavy),
                 color: .white,
                 contentView)
        setLabel("PCR数", size: size, centerX: leftX, y: 20, font: labelFont, color: color, contentView)
        setLabel("感染者数", size: size, centerX: rightX, y: 20, font: labelFont, color: color, contentView)
        setLabel("入院者数", size: size, centerX: leftX, y: 120, font: labelFont, color: color, contentView)
        setLabel("重症者数", size: size, centerX: rightX, y: 120, font: labelFont, color: color, contentView)
        setLabel("死者数", size: size, centerX: leftX, y: 220, font: labelFont, color: color, contentView)
        setLabel("退院者数", size: size, centerX: rightX, y: 220, font: labelFont, color: color, contentView)
        
        let height = view.frame.size.height / 2
        setButton("健康管理", size: size, y: height + 190, color: colors.blue, parentView: view).addTarget(self, action: #selector(goHealthCheck), for: .touchDown)
        //setButton("県別状況", size: size, y: height + 240, color: colors.blue, parentView: view)
        
        // ④のチャットボタン ※xはframe.originに代入される。
        // 画面サイズ分の数値(画面右端)から-50px左に貼り付けられることで、常に画面右上に表示させるよう調整している。
        setImageButton("chat", x: view.frame.size.width - 50).addTarget(self, action: #selector(chatAction), for: .touchDown)
        
        // ⑤のリロードボタン
        setImageButton("reload", x: 10).addTarget(self, action: #selector(reloadAction), for: .touchDown)
        
        // ⑥virusの画像
        let imageView = UIImageView()
        let image = UIImage(named: "virus")
        imageView.image = image
        imageView.frame = CGRect(x: view.frame.size.width, y: -65, width: 50, height: 50)
        contentView.addSubview(imageView)
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseIn], animations: {
            imageView.frame = CGRect(x: self.view.frame.size.width - 100, y: -65, width: 50, height: 50)
            imageView.transform = CGAffineTransform(rotationAngle: -90)
        }, completion: nil)
        
        // ⑦APIの呼び出し
        setAPI(parentView: contentView)
    }
    
    // ⑦APIの呼び出しメソッド
    func setAPI(parentView: UIView) {
        let pcr = UILabel()
        let positive = UILabel()
        let hospitalize = UILabel()
        let severe = UILabel()
        let death = UILabel()
        let discharge = UILabel()
        
        let size = CGSize(width: 200, height: 40)
        let leftX = view.frame.size.width * 0.38
        let rightX = view.frame.size.width * 0.85
        let font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        let color = colors.blue
        
        // ⑦のAPIラベル
        setAPILabel(pcr, size: size, centerX: leftX, y: 60, font: font, color: color, parentView)
        setAPILabel(positive, size: size, centerX: rightX, y: 60, font: font, color: color, parentView)
        setAPILabel(hospitalize, size: size, centerX: leftX, y: 160, font: font, color: color, parentView)
        setAPILabel(severe, size: size, centerX: rightX, y: 160, font: font, color: color, parentView)
        setAPILabel(death, size: size, centerX: leftX, y: 260, font: font, color: color, parentView)
        setAPILabel(discharge, size: size, centerX: rightX, y: 260, font: font, color: color, parentView)
        
        CovidAPI.getTotal(completion: { (result: CovidInfo.Total) -> Void in
            DispatchQueue.main.async {
                pcr.text = "\(result.pcr)"
                positive.text = "\(result.positive)"
                hospitalize.text = "\(result.hospitalize)"
                severe.text = "\(result.severe)"
                death.text = "\(result.death)"
                discharge.text = "\(result.discharge)"
            }
            
        })
    }
    
    // ⑦のAPIラベルを表示するメソッド
    func setAPILabel(_ label: UILabel, size: CGSize, centerX: CGFloat, y: CGFloat, font: UIFont, color: UIColor, _ parentView: UIView) {
        label.frame.size = size
        label.center.x = centerX
        label.frame.origin.y = y
        label.font = font
        label.textColor = color
        parentView.addSubview(label)
    }
    
    
    // ④・⑤のチャット/リロードボタンのメソッド
    func setImageButton(_ name: String, x: CGFloat) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: name), for: .normal)
        button.frame.size = CGSize(width: 30, height: 30)
        button.tintColor = .white
        button.frame.origin = CGPoint(x: x, y: 25)
        view.addSubview(button)
        return button
    }
    @objc func chatAction() {
        print("タップchat")
    }
    @objc func reloadAction() {
        loadView()
        viewDidLoad()
    }
    
    // 健康管理への画面遷移メソッド
    @objc func goHealthCheck() {
        performSegue(withIdentifier: "goHealthCheck", sender: nil)
    }
    
    
    // ボタンのメソッド
    func setButton(_ title: String, size: CGSize, y: CGFloat, color: UIColor, parentView: UIView) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.frame.size = size
        button.center.x = view.center.x // パーツの中心のx座標...ボタンの中心=viewの中心という定義
        // NSAttributedString...文字列に特殊な加工をできる。今回は文字感覚を設定
        let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.kern: 8.0])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.frame.origin.y = y
        button.setTitleColor(color, for: .normal)
        parentView.addSubview(button)
        return button
    }
    
    // ラベルのメソッド
    func setLabel(_ text: String, size: CGSize, centerX: CGFloat, y: CGFloat, font: UIFont, color: UIColor, _ parentView: UIView) {
        let label = UILabel()
        label.text = text
        label.frame.size = size
        label.center.x = centerX
        label.frame.origin.y = y
        label.font = font
        label.textColor = color
        parentView.addSubview(label)
    }
    
}

