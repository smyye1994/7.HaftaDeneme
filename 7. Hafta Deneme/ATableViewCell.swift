//
//  ATableViewCell.swift
//  7. Hafta Deneme
//
//  Created by Sümeyye Kılıçoğlu on 24.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()
    public let noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Note"
        return label
    }()
    
 
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray2
        contentView.addSubview(titleLabel)
        contentView.addSubview(noteLabel)
        configureContent()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        configureContent()
    }
    
    func configureContent() {
        
        titleLabel.topToSuperview().constant = 10
        titleLabel.leftToSuperview().constant = 10
        titleLabel.rightToSuperview().constant = -10
        
        noteLabel.bottomToTop(of: titleLabel).constant = 50
        noteLabel.leftToSuperview().constant = 10
        noteLabel.rightToSuperview().constant = -10
        noteLabel.bottomToSuperview().constant = -10
        
    }
}
