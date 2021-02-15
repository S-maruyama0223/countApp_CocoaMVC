//
//  ViewController.swift
//  CocoaMVCCountApp
//
//  Created by Shotaro Maruyama on 2021/02/12.
//  
//

import UIKit

class ViewController: UIViewController {
    
    var countModel:CountModel? {
        didSet {
            // ViewとModelを結合しModelの監視を開始する
            registerModel()
        }
    }
    // ここでなぜoverrideしたinitが呼ばれる？CountViewのinitの仮引数はどうなった？
    private(set) lazy var countView: CountView = CountView()
    
    override func loadView() {
        countView.backgroundColor = .systemBackground
        self.view = countView
        countModel = CountModel()
    }
    
    deinit {countModel?.notificationCenter.removeObserver(self)}
    
    private func registerModel() {
        guard let model = countModel else { return }
        
        countView.label.text = model.count.description
        // MとVを繋げるのはControllerの責務なのでこちらでaddTargetを行う。
        // これによりVとMはお互いを知らずに済む
        countView.minusButton.addTarget(self, action: #selector(onMinusTapped), for: .touchUpInside)
        countView.plusButton.addTarget(self, action: #selector(onPlusTapped), for: .touchUpInside)
        model.notificationCenter.addObserver(forName: .init(rawValue: "count"), object: nil, queue: nil, using: {[unowned self] notification in
            if let count = notification.userInfo?["count"] as? Int{
                self.countView.label.text = "\(count)"
            }
        })
    }
    @objc func onMinusTapped() {countModel?.countDown()}
    @objc func onPlusTapped() {countModel?.countUp()}
}

