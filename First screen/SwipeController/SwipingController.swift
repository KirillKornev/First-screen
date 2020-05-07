//
//  SwipingController.swift
//  First screen
//
//  Created by Кирилл on 5/7/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
  
  let source = SourceDataForPages()
  
  private let nextButton = CustomNextButton()
  private let prevButton = PrevButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    collectionView.isPagingEnabled = true
    registerCell()
    setupBottomControl()
    addTargetsForButtons()
  }
  
  private func addTargetsForButtons() {
    nextButton.addTarget(self, action:  #selector(handleNextButton), for: .touchUpInside)
    prevButton.addTarget(self, action:  #selector(handlePrevButton), for: .touchUpInside)
  }
  
  private func registerCell() {
    collectionView.register(PageCell.self, forCellWithReuseIdentifier: String(describing: PageCell.self))
  }
  
  fileprivate func setupBottomControl() {
     let bottomStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
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
  
  @objc func handleNextButton() {
    let nextIndex = min(pageControl.currentPage + 1, source.pages.count - 1)
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
    pc.numberOfPages = source.pages.count
    pc.pageIndicatorTintColor = .tintPink
    pc.currentPageIndicatorTintColor = .mainPink
    return pc
  }()
}

extension SwipingController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }
  
}
