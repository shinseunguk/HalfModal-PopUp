//
//  WebViewController.swift
//  TestProejct
//
//  Created by ukBook on 2023/03/01.
//

import Foundation
import UIKit
import WebKit
import SnapKit

final class WebViewController: UIViewController, ViewAttributes {
    
    lazy var xmark: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .black
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(dismissWebView), for: .touchUpInside)
        return btn
    }()
    
    let webView: WKWebView = {
        let view = WKWebView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
        setAttributes()
        webViewOpen()
    }
    
    func setUI() {
        
        self.view.addSubview(xmark)
        self.view.addSubview(webView)
    }
    
    func setAttributes() {
        
        xmark.snp.makeConstraints {
            
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            $0.right.equalTo(-20)
        }
        webView.snp.makeConstraints {
            
            $0.top.equalTo(xmark.snp.bottom).offset(10)
            $0.left.right.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func webViewOpen() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                if let url = URL(string: "https://s3.ap-northeast-2.amazonaws.com/image.summar.io/summar-privacy-policy.html") {
                    self.webView.load(URLRequest(url: url))
                }
            }
        }
    }
    
    @objc func dismissWebView() {
        self.dismiss(animated: true)
    }
}
