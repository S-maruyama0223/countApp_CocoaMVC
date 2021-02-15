//
//  CountModel.swift
//  CocoaMVCCountApp
//
//  Created by Shotaro Maruyama on 2021/02/12.
//  
//

import Foundation

protocol CountModelDelegate:AnyObject {
    func noticeCount(count:Int)
}

final class CountModel {
    weak var countModelDelegate:CountModelDelegate?
    private(set) var count = 0 {
        didSet {
            countModelDelegate?.noticeCount(count: count)
        }
    }
    
    func countDown() {
        count -= 1
    }
    
    func countUp() {
        count += 1
    }
    
}


