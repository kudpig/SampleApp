//
//  Entity.swift
//  SampleApp
//
//  Created by shinichiro kudo on 2021/02/08.
//

import Foundation

struct CovidInfo: Codable {
    
    struct Total: Codable {
        var pcr: Int
        var positive: Int
        var hospitalize: Int
        var severe: Int
        var death: Int
        var discharge: Int
    }
    
}
