//
//  ChartViewController.swift
//  SampleApp
//
//  Created by shinichiro kudo on 2021/02/11.
//

import UIKit

class ChartViewController: UIViewController {
    
    let colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 上部の青い部分。グラデーションにしている。
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60)
        gradientLayer.colors = [colors.bluePurple.cgColor, colors.blue.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0) // レイヤはviewには載せらせない。階層0に差し込み。
        
    }
    

    

}
