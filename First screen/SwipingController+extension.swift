//
//  SwipingController+extension.swift
//  First screen
//
//  Created by Кирилл on 5/7/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

extension SwipingController {
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
     
     coordinator.animate(alongsideTransition: { (_) in
       self.collectionViewLayout.invalidateLayout()
       let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
       self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
     }) { (_) in
     }
   }
}
