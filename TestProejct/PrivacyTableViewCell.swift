//
//  PrivacyTableViewCell.swift
//  TestProejct
//
//  Created by ukBook on 2023/03/01.
//

import Foundation
import UIKit
import SnapKit
import WebKit



final class PrivacyTableViewCell: UITableViewCell, ViewAttributes {
    weak var deleagte : delegate?
    
    var tagNumber: Int = 0
    
    lazy var checkmark: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "checkmark"), for: .normal)
        view.tintColor = .systemGray
        view.addTarget(self, action: #selector(didSelect(_:)), for: .touchUpInside)
        
        return view
    }()
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.sizeToFit()
        return view
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton()
        view.setTitle("보기", for: .normal)
        view.sizeToFit()
        view.setTitleColor(.systemGray, for: .normal)
        view.addTarget(self, action: #selector(openPrivacy), for: .touchUpInside)
        view.titleLabel?.font = .systemFont(ofSize: 13)
        
        let yourTitle = "보기"

        let attributedString = NSMutableAttributedString(string: yourTitle)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: yourTitle.count))

        view.setAttributedTitle(attributedString, for: .normal)
        
        return view
    }()
    
    lazy var webView: WKWebView = {
        let view = WKWebView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
        
        setUI()
        setAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        
        contentView.addSubview(checkmark)
        contentView.addSubview(label)
        contentView.addSubview(btn)
    }
    
    func setAttributes() {
        
        checkmark.snp.makeConstraints {
            
            $0.left.equalTo(20)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(30)
        }
        label.snp.makeConstraints {
            
            $0.left.equalTo(checkmark.snp.right).offset(10)
            $0.centerY.equalToSuperview()
        }
        btn.snp.makeConstraints {
            
            $0.right.equalTo(-20)
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc func openPrivacy() {
        self.deleagte?.openWebView()
        print(#function)
    }
    
    @objc func didSelect(_ sender: Any) {
        
        if checkmark.tintColor == .systemGray {
            
            checkmark.tintColor = .systemBlue
            print("\(tagNumber) 번째 체크박스 O")
            if tagNumber == 1 {
                self.deleagte?.checkAgreement(true)
            }
        }else {
            checkmark.tintColor = .systemGray
            print("\(tagNumber) 번째 체크박스 X")
            if tagNumber == 1 {
                self.deleagte?.checkAgreement(false)
            }
        }
    }
}
