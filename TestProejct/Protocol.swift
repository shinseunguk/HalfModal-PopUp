//
//  Protocol.swift
//  TestProejct
//
//  Created by ukBook on 2023/03/01.
//

import Foundation

protocol ViewAttributes: AnyObject {
    func setUI()
    func setAttributes()
}

protocol delegate: AnyObject {
    func openWebView()
    func checkAgreement(_ agreement: Bool)
}

protocol ModalDeleagte: AnyObject {
    func modalDelegate()
}


