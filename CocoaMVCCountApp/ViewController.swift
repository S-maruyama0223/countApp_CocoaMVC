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
    @IBOutlet weak var countView: CountView!

    deinit {countModel?.notificationCenter.removeObserver(self)}

    override func viewDidLoad() {
        super.viewDidLoad()
        countModel = CountModel()
    }
    
    private func registerModel() {
        guard let model = countModel else { return }
        
        countView.label.text = model.count.description
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

