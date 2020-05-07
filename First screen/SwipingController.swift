//
//  SwipingController.swift
//  First screen
//
//  Created by Кирилл on 5/7/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    registerCell()
    collectionView.isPagingEnabled = true
  }
  
  private func registerCell() {
    collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
//    cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
    return cell
  }
}

extension SwipingController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }
  
}
