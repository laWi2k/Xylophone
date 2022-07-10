//
//  DNButton.swift
//  Xylophone
//
//  Created by Daniel on 06.07.2022.
//

import UIKit

class DNButton: UIButton {

    init() {
        super.init(frame: .zero)
    }
    
    convenience init(title: String, color: UIColor, font: UIFont) {
        self.init()
        setTitle(title, for: .normal)
        backgroundColor = color
        self.titleLabel?.font = font
        layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
