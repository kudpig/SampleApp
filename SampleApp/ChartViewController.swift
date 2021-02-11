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
        
        // 上部ボタンのview(装飾)
        let backButton = UIButton(type: .system)
        backButton.frame = CGRect(x: 10, y: 30, width: 20, height: 20)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.tintColor = colors.white
        backButton.titleLabel?.font = .systemFont(ofSize: 20)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        view.addSubview(backButton)
        
        let nextButton = UIButton(type: .system)
        nextButton.frame = CGRect(x: view.frame.size.width - 105, y: 30, width: 100, height: 20)
        nextButton.setTitle("円グラフ", for: .normal)
        nextButton.setTitleColor(colors.white, for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 20)
        nextButton.addTarget(self, action: #selector(goCircle), for: .touchUpInside)
        view.addSubview(nextButton)
        
        // 上部の切り替えバーの設置
        let segment = UISegmentedControl(items: ["感染者数", "PCR数", "死者数"])
        segment.frame = CGRect(x: 10, y: 70, width: view.frame.size.width - 20, height: 20)
        segment.selectedSegmentTintColor = colors.blue
        segment.selectedSegmentIndex = 0
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : colors.bluePurple], for: .normal)
        segment.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        view.addSubview(segment)
    }
    
    // 画面上部のボタン２つのアクション
    @objc func backButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    @objc func goCircle() {
        print("tappedNextButton")
    }

    // 切り替えバーのメソッド
    @objc func switchAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("感染者数")
        case 1:
            print("PCR数")
        case 2:
            print("死者数")
        default:
            break
        }
    }
    

}
