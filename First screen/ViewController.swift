//
//  ViewController.swift
//  First screen
//
//  Created by Кирилл on 5/6/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let myImageView: UIImageView = {
    let image = UIImage(named: "image")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let descriptionTextView: UITextView = {
    let textView = UITextView()
    
    let attributedText = NSMutableAttributedString(string: "Добро пожаловать в наше приложение",
                                                   attributes: [NSMutableAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
    
    attributedText.append(NSAttributedString(string: "\n\n\n Вы готовы к работе с приложением?",
                                             attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
                                                          NSAttributedString.Key.foregroundColor : UIColor.gray]))
    textView.attributedText = attributedText
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.textAlignment = .center
    textView.isEditable = false
    textView.isSelectable = false
    return textView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(descriptionTextView)
    setupLayout()
  }
  
  private func setupLayout() {
    let topImageContainerView = UIView()
    view.addSubview(topImageContainerView)
    topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
    topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    topImageContainerView.addSubview(myImageView)
    myImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
    myImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
    myImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
    descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
    descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
  


}

