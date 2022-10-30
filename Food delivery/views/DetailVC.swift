//
//  DetailVC.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 27.10.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    static let identifier = "Detail"
    
    var nameTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black.withAlphaComponent(0.9)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setConsrtaints()
    }
    
    func setTitle(title: String){
        navigationItem.title = title
    }
    
    private func setView(){
        view.addSubview(nameTitle)
        view.backgroundColor = .systemRed
        title = nameTitle.text
    }
    
    private func setConsrtaints(){
            NSLayoutConstraint.activate([
                nameTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                nameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                nameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                nameTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -650)
            ])
    }
}
