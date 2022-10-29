//
//  ViewController.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    static let identifier = "ViewController"
    
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
    
    private let collectionViewCategory: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.clipsToBounds = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let kindsStoresCollectionView: UICollectionView = {
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

    private let sections = MockData.shared.category
    private let sectionsKindsStores = MockData.shared.kindsStores

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        settingView()
        setConstraints()

    }

    @objc func actionButtonOrder(){
        print("Hello")}
    
    func settingView(){
        navigationItem.title = "Food Delivery"
//        navigationItem.title = UI
//        navigationItem.titleView.
//        navigationItem.title.font = UIFont(name: "Arial Blod", size: 20)
//        navigationItem.title.font = UIFont.boldSystemFont(ofSize: 20)
//        navigationItem.title.textColor = .white.cgColor
//        navigationItem.title.textAlignment = .center
//
        view.backgroundColor = UIColor(named: "ColorBack")
//        view.addSubview(titleLbl)
        view.addSubview(collectionViewCategory)
        view.addSubview(kindsStoresCollectionView)
        view.addSubview(buttonOrder)

        self.collectionViewCategory.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        self.kindsStoresCollectionView.register(KindsStoresCollectionViewCell.self, forCellWithReuseIdentifier: KindsStoresCollectionViewCell.identifier)
        
        self.collectionViewCategory.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        
        collectionViewCategory.collectionViewLayout = createLayout()
        kindsStoresCollectionView.collectionViewLayout = createLayoutKindsStores()
    }
    
    private func setDelegates(){
        collectionViewCategory.delegate = self
        collectionViewCategory.dataSource = self
        kindsStoresCollectionView.delegate = self
        kindsStoresCollectionView.dataSource = self
    }
   

    func setConstraints(){
     NSLayoutConstraint.activate([

//            titleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -5),
//            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  0),
//            titleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  0),
//            titleLbl.heightAnchor.constraint(equalToConstant: 50),
//            titleLbl.widthAnchor.constraint(equalToConstant: view.bounds.height / 2),
//
        collectionViewCategory.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        collectionViewCategory.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
        collectionViewCategory.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
        collectionViewCategory.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 400),
        
        kindsStoresCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 270),
        kindsStoresCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
        kindsStoresCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
        kindsStoresCollectionView.bottomAnchor.constraint(equalTo: buttonOrder.topAnchor, constant: -100),
        
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
        UICollectionViewCompositionalLayout {[weak self] index, _ in

            guard let self = self else { return nil }
            let section = self.sections[index]
            return self.createCategorySection()
        }
    }
    
    private func createLayoutKindsStores()-> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout {[weak self] sectionsIndex, _ in

            guard let self = self else { return nil }
            return self.createKindStoresCategorySection()
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
                                                     supplementaryItems: [],
                                          contentInsets: false)
        
//        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)

        return section
    }
    
    private func createKindStoresCategorySection()-> NSCollectionLayoutSection {

        let item = NSCollectionLayoutItem(layoutSize:
                .init(widthDimension: .fractionalWidth(0.95),
                      heightDimension: .fractionalHeight(0.6)))
//        item.contentInsets.trailing = -40
//        item.contentInsets.bottom = 9
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                .init(widthDimension: .fractionalWidth(0.6),
                      heightDimension: .fractionalHeight(1)),subitems: [item])
        
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = settingCollectionLayoutSection(group: group,
                                                     behavior: .continuous,
                                                     intetGroupSpacing: 10,
                                                     supplementaryItems: [],
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailVC()
//        print("MARK - \(controller.setTitle(title: sections[indexPath.row].title))")
        navigationController?.pushViewController(controller, animated: true)
    }
//
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionViewCategory:
            return sections.count
        case kindsStoresCollectionView:
            return sectionsKindsStores.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        
        case collectionViewCategory:

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
             else {
                return UICollectionViewCell()
            }
            cell.setUp(category: sections[indexPath.row])
//            cell.setup(title: section[indexPath.row].title,
//                       images: section[indexPath.row].image)
            return cell
          
        case kindsStoresCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KindsStoresCollectionViewCell.identifier, for: indexPath) as? KindsStoresCollectionViewCell
             else {
                return UICollectionViewCell()
            }
            cell.setUp(item: sectionsKindsStores[indexPath.row])

//            cell.setup(title: kind[indexPath.row].title,
//                       images: kind[indexPath.row].image)
            return cell
            
        default:
            return UICollectionViewCell()
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
