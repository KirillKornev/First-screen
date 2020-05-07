//
//  CustomNextButton.swift
//  First screen
//
//  Created by Кирилл on 5/7/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class CustomNextButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupButton()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupButton() {
    self.setTitle("NEXT", for: .normal)
    self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    self.setTitleColor(.mainPink, for: .normal)
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
