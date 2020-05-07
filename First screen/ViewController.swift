//
//  ViewController.swift
//  First screen
//
//  Created by Кирилл on 5/6/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.currentPage = 0
    pc.numberOfPages = 5
    pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 244/255, alpha: 1)
    pc.currentPageIndicatorTintColor = .mainPink
    return pc
  }()
  
  private let myImageView: UIImageView = {
    let image = UIImage(named: "trees1")
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
    setupBottomControl()
  }
  
  fileprivate func setupBottomControl() {
     let bottomStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextsButton])
    view.addSubview(bottomStackView)
    bottomStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomStackView.distribution = .fillEqually
    
    NSLayoutConstraint.activate([
      bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      bottomStackView.heightAnchor.constraint(equalToConstant: 50)
    ])
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
  
  private let previousButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("PREV", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let nextsButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("NEXT", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.mainPink, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
    return button
  }()

  @objc private func handleNextButton() {
    print("trying to advance next")
  }

}

extension UIColor {
  static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}
