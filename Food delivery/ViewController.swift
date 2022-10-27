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
        btn.backgroundColor = .systemRed.withAlphaComponent(0.7)
        btn.setTitle("Заказать", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Arial", size: 20)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.textColor = UIColor(named: "colorBtn")
        btn.addTarget(self, action: #selector(actionButtonOrder), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.clipsToBounds = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Food Delivery"
        label.font = UIFont(name: "Arial Blod", size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private let sections = MockData.shared.pageData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        settingView()
        setConstraints()

    }

    @objc func actionButtonOrder(){
        print("Hello")}
    
    func settingView(){
       
        view.backgroundColor = UIColor(named: "ColorBack")
        view.addSubview(titleLbl)
        view.addSubview(collectionView)
        view.addSubview(buttonOrder)

        self.collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        self.collectionView.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        
        collectionView.collectionViewLayout = createLayout()

    }
    
    private func setDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func setConstraints(){
     NSLayoutConstraint.activate([

            titleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -5),
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  0),
            titleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  0),
            titleLbl.heightAnchor.constraint(equalToConstant: 50),
            titleLbl.widthAnchor.constraint(equalToConstant: view.bounds.height / 2),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: buttonOrder.topAnchor, constant: -410),

            buttonOrder.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonOrder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            buttonOrder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),

            buttonOrder.heightAnchor.constraint(equalToConstant: 50),
            buttonOrder.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
//MARK: - Create Layout
extension ViewController {
    private func createLayout()-> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout {[weak self] sectionsIndex, _ in

            guard let self = self else { return nil }
            let section = self.sections[sectionsIndex]
            
            
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

        let item = NSCollectionLayoutItem(layoutSize:
                .init(widthDimension: .fractionalWidth(0.50),
                      heightDimension: .absolute(68)))
        item.contentInsets.trailing = 13
        item.contentInsets.bottom = 9
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                .init(widthDimension: .fractionalWidth(1),
                      heightDimension: .estimated(500)),subitems: [item])
        
        group.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 10)

        let section = settingCollectionLayoutSection(group: group,
                                                     behavior: .none,
                                                     intetGroupSpacing: 5,
                                                     supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        
//        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)

        return section
    }
    private func supplementaryHeaderItem()->NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return sections.count
//
//    }
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch self.sections[indexPath.section]{
        case .category(let section):

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
             else {
                return UICollectionViewCell()
            }
        
            cell.setup(title: section[indexPath.row].title,
                       images: section[indexPath.row].image)
            return cell
          
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
