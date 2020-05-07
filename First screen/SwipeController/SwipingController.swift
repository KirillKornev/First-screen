//
//  SwipingController.swift
//  First screen
//
//  Created by Кирилл on 5/7/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
  
   let pages = [Page(imageName: "trees1",
                            headerText: "Добро пожаловать в мое учебное приложение",
                            bodyText: "Здесь ты найдешь множество интересных фактов про природу"),
                      Page(imageName: "trees2",
                           headerText: "Самый крупные лесные массивы на планете",
                           bodyText: "Самый крупные лесные массивы на планете — тайга и южноамериканские джунгли."),
                      Page(imageName: "trees3",
                           headerText: "Самая лесистая страна в мире",
                           bodyText: "Это - Финляндия, около 70% которой покрыто лесом. Не сильно от неё отстаёт и Черногория"),
                      Page(imageName: "trees4",
                           headerText: "Самое высокое дерево на Земле",
                           bodyText: "Это - растущая в США секвойя высотой 112 метров"),
                      Page(imageName: "trees5",
                           headerText: "Наиболее распространённое на Земле дерево",
                           bodyText: "Это - Берёза-  широко распространённое дерево, занимающее важное место в традиционной славянской культуре")
                      ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    registerCell()
    collectionView.isPagingEnabled = true
    setupBottomControl()
  }
  
  private func registerCell() {
    collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
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
  
  private let previousButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("PREV", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(handlePrevButton), for: .touchUpInside)
    return button
  }()
  
  private let nextsButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("NEXT", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.mainPink, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action:  #selector(handleNextButton), for: .touchUpInside)
    return button
  }()
  
  @objc func handleNextButton() {
    let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
    let indexPath = IndexPath(item: nextIndex, section: 0)
    pageControl.currentPage = nextIndex
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  }
  
  @objc func handlePrevButton() {
    let nextIndex = max(pageControl.currentPage - 1, 0)
    let indexPath = IndexPath(item: nextIndex, section: 0)
    pageControl.currentPage = nextIndex
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
   }
  
   lazy var pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.currentPage = 0
    pc.numberOfPages = pages.count
    pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 244/255, alpha: 1)
    pc.currentPageIndicatorTintColor = .mainPink
    return pc
  }()
  
}

extension SwipingController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }
  
}
