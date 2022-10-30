//
//  AvailableDeliveriesCollectionView.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 29.10.2022.
//

import UIKit

class AvailableDeliveriesCollectionView: UICollectionViewCell {
    
    static let identifier = "AvailableDeliveriesCollectionView"
    
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
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        image.layer.cornerRadius = 10
        image.image = UIImage(named: "")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var nameLbl: UILabel = {
        let label = UILabel()
        label.text = "Выбор магаизнов"
        label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black.withAlphaComponent(0.9)
        label.textAlignment = .center
        label.numberOfLines = 0
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
        backgroundColor = .red
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor.copy(alpha: 0.5)
        layer.shadowOpacity = 0.7
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        //        backgroundColor = .white
        //        addSubview(image)
        //        addSubview(view)
        addSubview(stack)
        stack.addArrangedSubview(view)
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(nameLbl)
        
        
    }
    
    func setUp(item: SalesItem){
        nameLbl.text = item.title
        image.image = UIImage(named: "\(item.image)")
        
        //        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
    
    private func setConsrtaints(){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            image.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            nameLbl.topAnchor.constraint(equalTo: topAnchor, constant: 175),
            //leadingAnchor =  от левого края
            nameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            nameLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            //                nameLbl.heightAnchor.constraint(equalToConstant: 8),
            //                nameLbl.widthAnchor.constraint(equalToConstant: 8),
            
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
}

