//
//  CustomTextField.swift
//  
//
//  Created by MB Labs on 06/02/24.
//

import UIKit

public class CustomTextField: UITextField {
    public init(placeholder: String) {
        super.init(frame: .zero)
        
        let spacerView = UIView()
        spacerView.setDimensions(height: 50, width: 12)
        leftView = spacerView
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(50)
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
