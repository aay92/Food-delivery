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
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        view.layer.shadowOffset = .init(width: 1, height: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green.withAlphaComponent(0.2)
        return view
    }()
    
    private let stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillEqually
//        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .gray
        image.layer.cornerRadius = 10
        image.image = UIImage(systemName: "person")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var nameLbl: UILabel = {
        let label = UILabel()
        label.text = "Категория"
        label.font = UIFont.systemFont(ofSize: 10)
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
//        addSubview(image)
//        addSubview(view)
        addSubview(stack)
        stack.addArrangedSubview(view)
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(nameLbl)

       
    }
    func setup(title: String, images: String){
        nameLbl.text = title
        image.image = UIImage(systemName: images)
    }
    func setupOnlyTitile(title: String){
        nameLbl.text = title
    }
    
    private func setConsrtaints(){
            NSLayoutConstraint.activate([
//                nameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
//                nameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
//                nameLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//                nameLbl.heightAnchor.constraint(equalToConstant: 16),
//
//                image.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//                image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
//                image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
//                image.bottomAnchor.constraint(equalTo: nameLbl.topAnchor, constant: -10),
                
                stack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
                stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ])
    }
    
}

