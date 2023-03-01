//
//  ViewController.swift
//  TestProejct
//
//  Created by ukBook on 2023/03/01.
//

import UIKit
import Then
import SnapKit
import WebKit


class ViewController: UIViewController, ViewAttributes, ModalDeleagte{
    
    lazy var btn = UIButton().then {
        $0.setTitle("Modal PopUp", for: .normal)
        $0.setTitleColor(UIColor.systemBlue, for: .normal)
        $0.sizeToFit()
        $0.addTarget(self, action: #selector(test), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
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
        self.view.backgroundColor = .systemGray5
        
        let VC = ModalViewController()
        VC.delegate = self
        VC.modalPresentationStyle = .custom
        VC.transitioningDelegate = self
        present(VC, animated: true, completion: nil)
    }
    
    func modalDelegate() {
        self.view.backgroundColor = .white
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    return HalfModalPresentationController(presentedViewController: presented, presenting: presenting)
  }
}

