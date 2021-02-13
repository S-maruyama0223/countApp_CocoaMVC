//
//  CountView.swift
//  CocoaMVCCountApp
//
//  Created by Shotaro Maruyama on 2021/02/13.
//  
//

import UIKit

final class CountView: UIView {
    let label: UILabel
    let minusButton: UIButton
    let plusButton: UIButton
    
    required init?(coder aDecoder: NSCoder) {
        // ここで初期化しないとエラーになるが…なぜ？というかこのinitはいつ呼ばれる？
        self.label = UILabel()
        self.minusButton = UIButton()
        self.plusButton = UIButton()
        super.init(coder:aDecoder)
    }
    
    override init(frame:CGRect) {
        // ここで画面レイアウトするというが、self.viewのframeが決まっていないのにどうやって？
        self.label = UILabel()
        self.minusButton = UIButton()
        self.plusButton = UIButton()
        super.init(frame: frame)
    }
    
}
