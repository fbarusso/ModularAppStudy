//
//  MoviesListTableViewCell.swift
//  
//
//  Created by MB Labs on 08/02/24.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: MoviesListTableViewCell.self)
    
    private let nameLabel = UILabel()
    
    var name: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(nameLabel)
        nameLabel.fillSuperview()
    }
    
    private func didSetName() {
        nameLabel.text = name
    }
}
