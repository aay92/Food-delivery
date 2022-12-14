//
//  CategoryCollectionViewCell.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 23.10.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    private let view: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let stack: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = false
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear

        return stackView
    }()
    

    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        image.layer.cornerRadius = 10
        image.image = UIImage(named: "")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var nameLbl: UILabel = {
        let label = UILabel()
        label.text = "Категория"
        label.font = UIFont.systemFont(ofSize: 10)
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .black.withAlphaComponent(0.9)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 2
                layer.borderColor = UIColor.red.withAlphaComponent(0.5).cgColor
                
                layer.shadowColor = UIColor.black.cgColor.copy(alpha: 0.5)
                layer.shadowOpacity = 0.7
                layer.shadowOffset = .zero
                layer.shadowRadius = 5
            } else {
                layer.borderWidth = 0
                layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor

                layer.shadowColor = UIColor.black.cgColor.copy(alpha: 0.5)
                layer.shadowOpacity = 0.7
                layer.shadowOffset = .zero
                layer.shadowRadius = 5
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConsrtaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView(){
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor.copy(alpha: 0.5)
        layer.shadowOpacity = 0.7
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
//        backgroundColor = .white
//        addSubview(image)
//        addSubview(view)
        addSubview(stack)
        stack.addArrangedSubview(view)
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(nameLbl)

       
    }
    
    func setUp(category: Item){
        nameLbl.text = category.title
        image.image = UIImage(named: "\(category.image)")
        
//        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
    
    func setup(title: String, images: String){
        nameLbl.text = title
        image.image = UIImage(named: images)
    }
    
    private func setConsrtaints(){
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
                
                nameLbl.topAnchor.constraint(equalTo: topAnchor, constant: 13),
//leadingAnchor =  от левого края
                nameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
                nameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
                nameLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19),
//                nameLbl.heightAnchor.constraint(equalToConstant: 8),
//                nameLbl.widthAnchor.constraint(equalToConstant: 8),

                image.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
                image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
                
                stack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
                stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ])
    }
    
}

