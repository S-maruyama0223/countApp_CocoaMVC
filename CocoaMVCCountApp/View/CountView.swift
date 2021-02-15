//
//  CountView.swift
//  CocoaMVCCountApp
//
//  Created by Shotaro Maruyama on 2021/02/13.
//  
//

import UIKit

final class CountView: UIView {
    let label: UILabel = UILabel()
    let minusButton: UIButton = UIButton()
    let plusButton: UIButton = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        // frameは親viewからの相対的な座標軸なので実際のCountのframe値の影響は受けない
        label.frame = CGRect(x: 180, y: 60, width: 30, height: 30)
        minusButton.frame = CGRect(x: 120, y: 150, width: 70, height: 70)
        minusButton.setTitle("➖", for: .normal)
        plusButton.frame = CGRect(x: 190, y: 150, width: 70, height: 70)
        plusButton.setTitle("➕", for: .normal)
        self.addSubview(minusButton)
        self.addSubview(plusButton)
        self.addSubview(label)
    }
    
}
