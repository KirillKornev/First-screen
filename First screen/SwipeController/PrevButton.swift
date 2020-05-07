//
//  PrevButton.swift
//  First screen
//
//  Created by Кирилл on 5/7/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class PrevButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupButton() {
    self.setTitle("PREV", for: .normal)
    self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    self.setTitleColor(.gray, for: .normal)
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

