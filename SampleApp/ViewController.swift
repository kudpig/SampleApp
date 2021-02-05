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
        let gradientLeyer = CAGradientLayer()
        // CGRectでフレームそのものの座標を指定。xyは左上の位置。widthとheightはフレームのサイズ。
        gradientLeyer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2)
        gradientLeyer.colors = [colors.bluePurple.cgColor, colors.blue.cgColor]
        gradientLeyer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLeyer.endPoint = CGPoint.init(x: 1, y: 1)
        view.layer.insertSublayer(gradientLeyer, at: 0)
    }


}

