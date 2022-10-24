//
//  ViewController.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let buttonOrder: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemRed
        btn.setTitle("Заказать", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Arial", size: 17)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.textColor = UIColor(named: "colorBtn")
//        btn.addTarget(self, action: " :", forControlEvents: UIControlEvents.TouchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .red
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Food Delivery"
        label.font = UIFont(name: "Arial", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        setConstraints()
        setDelegates()
    }

    func settingView(){
        view.backgroundColor = .systemBlue
        view.addSubview(titleLbl)
        view.addSubview(collectionView)
        view.addSubview(buttonOrder)

        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        collectionView.collectionViewLayout = createLayout()

    }
    
    private func setDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  10),
            titleLbl.heightAnchor.constraint(equalToConstant: 50),
            titleLbl.widthAnchor.constraint(equalToConstant: 150),
            
            collectionView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            buttonOrder.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonOrder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  40),

            buttonOrder.heightAnchor.constraint(equalToConstant: 50),
            buttonOrder.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
//MARK: - Create Layout
extension ViewController {
    private func createLayout()-> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {[weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            
            switch section {
            case .category(_):
                return self.createCategorySection()
            }
        }
    }
    
    //       быстрые настройки секции коллекции
    private func settingCollectionLayoutSection(group: NSCollectionLayoutGroup,
                                         behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                         intetGroupSpacing: CGFloat,
                                         supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
                                         contentInsets: Bool)-> NSCollectionLayoutSection{
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = intetGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    
    private func createCategorySection()-> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15)), subitems: [item])
        
//        group.interItemSpacing = .flexible(10)
        
        let section = settingCollectionLayoutSection(group: group,
                                          behavior: .none,
                                                     intetGroupSpacing: 10,
                                          supplementaryItems: [],
                                          contentInsets: false)

        return section
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.row]{
        case .category(let section):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(title: section[indexPath.row].title, images: section[indexPath.row].image)
            return cell
        }
        
    }
    
    
}

