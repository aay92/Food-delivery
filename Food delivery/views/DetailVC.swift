//
//  DetailVC.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 27.10.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    static let identifier = "Detail"
    
    var nameTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        title = ""
    }
    func setTitle(title: String){
        self.nameTitle = title
    }
}
