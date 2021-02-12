//
//  CountModel.swift
//  CocoaMVCCountApp
//
//  Created by Shotaro Maruyama on 2021/02/12.
//  
//

import Foundation

final class CountModel {
    let notificationCenter = NotificationCenter()
    private(set) var count = 0 {
        didSet {
            notificationCenter.post(name: .init(rawValue: "count"),
            object: nil,
            userInfo: ["count":count])
        }
    }
    
    func countDown() {
        count -= 1
    }
    
    func countUp() {
        count += 1
    }
    
}


