//
//  SwipingController.swift
//  First screen
//
//  Created by Кирилл on 5/7/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
  
  private let pages = [Page(imageName: "trees1",
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
  }
  
  private func registerCell() {
    collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pages.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell
    let page = pages[indexPath.row]
    cell.configurePage(page: page)
    return cell
  }
}

extension SwipingController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }
  
}
