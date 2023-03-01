//
//  ModalViewController.swift
//  TestProejct
//
//  Created by ukBook on 2023/03/01.
//

import Foundation
import UIKit
import SnapKit



class ModalViewController: UIViewController, ViewAttributes, delegate {
    weak var delegate: ModalDeleagte?
    
    let tableViewArr = [
    "Summar 서비스 동의",
    "[필수] 개인정보 수집·이용 동의",
    "[선택] 마케팅 정보 수신동의"
    ]
    
    lazy var btn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.sizeToFit()
        button.addTarget(self, action: #selector(test), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView : UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(PrivacyTableViewCell.self, forCellReuseIdentifier: "PrivacyTableViewCell")
        view.separatorStyle = .none
        view.isScrollEnabled = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var registerBtn: UIButton = {
        let button = UIButton()
        button.setTitle("동의후 회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.layer.cornerRadius = 10
        
        setUI()
        setAttributes()
    }
    
    func setUI() {
        
        self.view.addSubview(btn)
        self.view.addSubview(tableView)
        self.view.addSubview(registerBtn)
    }
    
    func setAttributes() {
        
        btn.snp.makeConstraints {
            
            $0.top.equalTo(10)
            $0.right.equalTo(-20)
        }
        tableView.snp.makeConstraints {
            
            $0.top.equalTo(btn.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(200)
        }
        registerBtn.snp.makeConstraints {
            
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            $0.height.equalTo(45)
        }
    }
    
    @objc func test() {
        self.delegate?.modalDelegate()
        
        self.dismiss(animated: true)
    }
    
}

extension ModalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrivacyTableViewCell", for: indexPath) as! PrivacyTableViewCell
        cell.deleagte = self
        cell.label.text = tableViewArr[indexPath.row]
        cell.tagNumber = indexPath.row
        
        switch indexPath.row {
        case 0:
            cell.checkmark.alpha = 0.0
            cell.btn.alpha = 0.0
        case 1:
            cell.checkmark.alpha = 1.0
            cell.btn.alpha = 1.0
        case 2:
            cell.checkmark.alpha = 1.0
            cell.btn.alpha = 0.0
        default:
            break
        }
        
        return cell
    }
    
    func openWebView() {
        let VC = WebViewController()
        VC.modalPresentationStyle = .fullScreen
        
        self.present(VC, animated: true, completion: nil)
    }
    
    func checkAgreement(_ agreement: Bool) {
        
        if agreement {
            registerBtn.backgroundColor = .systemBlue
            registerBtn.isEnabled = true
        }else {
            registerBtn.backgroundColor = .systemBlue
            registerBtn.isEnabled = false
        }
    }
}

