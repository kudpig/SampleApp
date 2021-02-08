//
//  HealthCheckViewController.swift
//  SampleApp
//
//  Created by shinichiro kudo on 2021/02/08.
//

import UIKit

class HealthCheckViewController: UIViewController {
    
    let colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGroupedBackground
        
        let scrollView = UIScrollView()
        // frameは画面上のどこをスクロールビュー(窓)にするかを指定しており、contentSizeは中身のサイズ
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        view.addSubview(scrollView)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
