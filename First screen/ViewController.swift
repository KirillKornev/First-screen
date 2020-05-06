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
    return imageView
  }()
  
  private let descriptionTextView: UITextView = {
    let textView = UITextView()
    textView.text = "Добро пожаловать в наше приложение"
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.font = UIFont.boldSystemFont(ofSize: 18)
    textView.textAlignment = .center
    textView.isEditable = false
    textView.isSelectable = false
    return textView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(myImageView)
    view.addSubview(descriptionTextView)
    setupLayout()
  }
  
  private func setupLayout() {
    //image
    myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    myImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    myImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    myImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    //description
    descriptionTextView.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 100).isActive = true
    descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
  }
  


}

