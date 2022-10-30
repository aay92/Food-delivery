//
//  ViewController.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    static let identifier = "ViewController"
    
    func contentSize()-> CGSize{
        CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    }
    
    private let buttonOrder: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemRed.withAlphaComponent(0.7)
        btn.setTitle("Заказать", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Arial", size: 20)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.textColor = UIColor(named: "colorBtn")
        btn.addTarget(ViewController.self, action: #selector(actionButtonOrder), for: .touchUpInside)
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
    
    private let availableDeliveriesCollectionView: UICollectionView = {
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
    
//    private let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .systemBlue.withAlphaComponent(0.2)
//        return scrollView
//    }()
    
    private let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.backgroundColor = .clear
        stack.spacing = 20
        return stack
    }()
    
    private let sections = MockData.shared.category
    private let sectionsKindsStores = MockData.shared.kindsStores
    private let sectionsAvailableDeliveries = MockData.shared.availableDeliveries
    private let header = MockData.header.self
    
    
    
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
        view.backgroundColor = UIColor(named: "ColorBack")
//        self.scrollView.frame = self.view.bounds

////        scroll view
//        scrollView.contentSize = contentSize()
//        self.view.addSubview(scrollView)
////        сделать стек и засунуть солекции
//        self.scrollView.addSubview(collectionViewCategory)
////        stackView.addSubview(collectionViewCategory)
//
//
//        scrollView.addSubview(kindsStoresCollectionView)
//        scrollView.addSubview(availableDeliveriesCollectionView)

        view.addSubview(collectionViewCategory)
        view.addSubview(kindsStoresCollectionView)
        view.addSubview(availableDeliveriesCollectionView)
//        view.addSubview(buttonOrder)
    
        
        self.collectionViewCategory.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        self.collectionViewCategory.register(HeaderSupplementaryView.self,
                                             forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderSupplementaryView.identifier)
        
        self.kindsStoresCollectionView.register(KindsStoresCollectionViewCell.self, forCellWithReuseIdentifier: KindsStoresCollectionViewCell.identifier)
        self.kindsStoresCollectionView.register(HeaderSupplementaryView.self,
                                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderSupplementaryView.identifier)
        
        self.availableDeliveriesCollectionView.register(AvailableDeliveriesCollectionView.self, forCellWithReuseIdentifier: AvailableDeliveriesCollectionView.identifier)
        self.availableDeliveriesCollectionView.register(HeaderSupplementaryView.self,
                                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderSupplementaryView.identifier)
        
        collectionViewCategory.collectionViewLayout = createLayout()
        kindsStoresCollectionView.collectionViewLayout = createLayoutKindsStores()
        availableDeliveriesCollectionView.collectionViewLayout = createLayoutAvailableDeliveries()
    }
    
    private func setDelegates(){
        collectionViewCategory.delegate = self
        collectionViewCategory.dataSource = self
        kindsStoresCollectionView.delegate = self
        kindsStoresCollectionView.dataSource = self
        availableDeliveriesCollectionView.delegate = self
        availableDeliveriesCollectionView.dataSource = self
    }
    
    
    func setConstraints(){
        
        let safeG = view.safeAreaLayoutGuide
        // we want to constrain subviews to the scroll view's Content Layout Guide
//        let contentG = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            
            collectionViewCategory.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionViewCategory.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            collectionViewCategory.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            collectionViewCategory.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 430),

            kindsStoresCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            kindsStoresCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            kindsStoresCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            kindsStoresCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),

            availableDeliveriesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
            availableDeliveriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            availableDeliveriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            availableDeliveriesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5),
            
//            buttonOrder.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
//            buttonOrder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
//            buttonOrder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
//            buttonOrder.heightAnchor.constraint(equalToConstant: 50),
//            buttonOrder.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
//MARK: - Create Layout
extension ViewController {
    private func createLayout()-> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout {[weak self] index, _ in
            
            guard let self = self else { return nil }
            //            let section = self.sections[index]
            return self.createCategorySection()
        }
    }
    
    private func createLayoutKindsStores()-> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout {[weak self] sectionsIndex, _ in
            
            guard let self = self else { return nil }
            return self.createKindStoresCategorySection()
        }
    }
    
    private func createLayoutAvailableDeliveries()-> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout {[weak self] sectionsIndex, _ in
            
            guard let self = self else { return nil }
            return self.createAvailableDeliveriesSection()
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
    
    private func createKindStoresCategorySection()-> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize:
                .init(widthDimension: .fractionalWidth(0.90),
                      heightDimension: .fractionalHeight(0.55)))
        //        item.contentInsets.trailing = -40
        //        item.contentInsets.bottom = 9
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                .init(widthDimension: .fractionalWidth(0.6),
                      heightDimension: .fractionalHeight(0.8)),subitems: [item])
        
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = settingCollectionLayoutSection(group: group,
                                                     behavior: .continuous,
                                                     intetGroupSpacing: 10,
                                                     supplementaryItems: [supplementaryHeaderItem()],
                                                     contentInsets: false)
        //        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func createAvailableDeliveriesSection()-> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize:
                .init(widthDimension: .fractionalWidth(1),
                      heightDimension: .fractionalHeight(1)))
        //        item.contentInsets.trailing = -40
        //        item.contentInsets.bottom = 9
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                .init(widthDimension: .fractionalWidth(1),
                      heightDimension: .fractionalHeight(0.7)),subitems: [item])
        
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = settingCollectionLayoutSection(group: group,
                                                     behavior: .groupPaging,
                                                     intetGroupSpacing: 10,
                                                     supplementaryItems: [supplementaryHeaderItem()],
                                                     contentInsets: false)
        //        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func supplementaryHeaderItem()->NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(40)),
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
        switch collectionView {
        case collectionViewCategory:
            let controller = DetailVC()
            controller.setTitle(title: sections[indexPath.row].title)
            navigationController?.pushViewController(controller, animated: true)
        case kindsStoresCollectionView:
            let controller = DetailsStore()
            controller.setTitle(title: sectionsKindsStores[indexPath.row].title)
            navigationController?.pushViewController(controller, animated: true)
        case availableDeliveriesCollectionView:
            let controller = DetailsStore()
            controller.setTitle(title: sectionsAvailableDeliveries[indexPath.row].title)
            navigationController?.pushViewController(controller, animated: true)
            
        default:
            print("")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionViewCategory:
            return sections.count
        case kindsStoresCollectionView:
            return sectionsKindsStores.count
        case availableDeliveriesCollectionView:
            return sectionsAvailableDeliveries.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            
        case collectionViewCategory:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                    CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.setUp(category: sections[indexPath.row])
            return cell
            
        case kindsStoresCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                    KindsStoresCollectionViewCell.identifier, for: indexPath) as? KindsStoresCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.setUp(item: sectionsKindsStores[indexPath.row])
            return cell
            
        case availableDeliveriesCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                    AvailableDeliveriesCollectionView.identifier, for: indexPath) as? AvailableDeliveriesCollectionView
            else {
                return UICollectionViewCell()
            }
            cell.setUp(itemAvailableDeliveries: sectionsAvailableDeliveries[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSupplementaryView.identifier, for: indexPath) as? HeaderSupplementaryView
            if (collectionView == collectionViewCategory) {
                headerView?.configureHeader(categoryName: header.category.item)
            } else if collectionView == kindsStoresCollectionView {
                headerView?.configureHeader(categoryName: header.kindsStores.item)
            } else if collectionView == availableDeliveriesCollectionView {
                headerView?.configureHeader(categoryName: header.availableDeliveries.item)
            }
            return headerView!
        }
        fatalError()
    }
}
