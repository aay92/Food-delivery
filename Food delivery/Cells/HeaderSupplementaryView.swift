//
//  HeaderSupplementaryView.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 25.10.2022.
//

import Foundation

import UIKit

class HeaderSupplementaryView : UICollectionReusableView {
    
    static let identifier = "HeaderSupplementaryView"
    
    private let headerLabel: UILabel = {
        
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(headerLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(categoryName:String){
        headerLabel.text = categoryName
    }
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}
