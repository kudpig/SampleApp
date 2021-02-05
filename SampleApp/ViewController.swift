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
    }
    
}

