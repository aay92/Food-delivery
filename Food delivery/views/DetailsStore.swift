//
//  DetailsStore.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 29.10.2022.
//

import UIKit

class DetailsStore: UIViewController {
    
    static let identifier = "DetailsStore"
    
    var nameTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView(){
        view.backgroundColor = .systemBlue
//        title = nameTitle
    }
    
    func setTitle(title: String){
        navigationItem.title = title
    }
}
