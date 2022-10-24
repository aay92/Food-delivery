//
//  CategoryCollectionViewCell.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 23.10.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .red
        image.image = UIImage(named: "8")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameLbl: UILabel = {
        let label = UILabel()
        label.text = "Категория"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConsrtaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView(){
        backgroundColor = .white
        addSubview(image)
        addSubview(nameLbl)
       
    }
    func setup(title: String, images: String){
        nameLbl.text = title
        image.image = UIImage(named: images)
    }
    
    private func setConsrtaints(){
            NSLayoutConstraint.activate([
                nameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                nameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
                nameLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
                nameLbl.heightAnchor.constraint(equalToConstant: 16),
                
                image.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
                image.bottomAnchor.constraint(equalTo: nameLbl.topAnchor, constant: 0),
            ])
    }
    
}

