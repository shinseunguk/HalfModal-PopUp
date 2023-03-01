//
//  ModalViewController.swift
//  TestProejct
//
//  Created by ukBook on 2023/03/01.
//

import Foundation

class ModalViewController: UIViewController, ViewAttributes {
    
    lazy var btn = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("modal 팝업", for: .normal)
        $0.sizeToFit()
        $0.addTarget(self, action: #selector(test), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAttributes()
    }
    
    func setUI() {
        
        self.view.addSubview(btn)
    }
    
    func setAttributes() {
        
        btn.snp.makeConstraints {
            
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func test() {
        
        print("test")
        self.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: true)
    }
    
}

