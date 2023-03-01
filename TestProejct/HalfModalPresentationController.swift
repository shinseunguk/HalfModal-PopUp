//
//  HalfModalPresentationController.swift
//  TestProejct
//
//  Created by ukBook on 2023/03/01.
//

import Foundation
import UIKit

class HalfModalPresentationController: UIPresentationController {
  override var frameOfPresentedViewInContainerView: CGRect {
    guard let containerView = containerView else { return CGRect.zero }
    let height = containerView.frame.height / 3.0
    return CGRect(x: 0, y: containerView.frame.height - height, width: containerView.frame.width, height: height)
  }

  override func containerViewWillLayoutSubviews() {
    presentedView?.frame = frameOfPresentedViewInContainerView
  }
}
