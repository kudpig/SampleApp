//
//  API.swift
//  SampleApp
//
//  Created by shinichiro kudo on 2021/02/08.
//

import Foundation
import UIKit

struct CovidAPI {
    // staticをつけると外部から呼びだす際にインスタンス化を省略できる
    static func getTotal(completion: @escaping (CovidInfo.Total) -> Void) {
        
        let url = URL(string: "https://covid19-japan-web-api.now.sh/api/v1/total")
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("error:\(error!.localizedDescription)")
            }
            if let data = data {
                let result = try! JSONDecoder().decode(CovidInfo.Total.self, from: data)
                completion(result)
            }
        }.resume()
    
    }
    
}
