//
//  CustomButton.swift
//  
//
//  Created by MB Labs on 06/02/24.
//

import UIKit

public class CustomButton: UIView {
    
    public var isValid: Bool = false {
        didSet {
            configureValidState()
        }
    }
    
    public lazy var button = UIButton(type: .system)
    
    public init(title: String) {
        super.init(frame: .zero)
        
        addSubview(button)
        button.fillSuperview()
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        
        configureValidState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureValidState() {
        //button.isEnabled = isValid
        if isValid {
            button.backgroundColor = #colorLiteral(red: 0.3647058824, green: 0.07058823529, blue: 0.968627451, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , for: .normal)
        } else {
            button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
            button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.67) , for: .normal)
        }
    }
}
