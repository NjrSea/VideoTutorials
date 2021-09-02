//
//  CollectionViewDemoViewController.swift
//  ViewControllerDemo
//
//  Created by wang ya on 2021/8/11.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    static let reuseIdenfitierString = "MyCollectionViewCell"
}

class CollectionViewDemoViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    private var collectionView: UICollectionView!
    private var collectionViewLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        // layout
        //        https://github.com/roberthein/BouncyLayout
        //        https://github.com/Tuberose621/-CollectionViewLayout-CollectionViewFlowLayout-
        // https://github.com/yacir/CollectionViewSlantedLayout
        // https://github.com/ra1028/RACollectionViewReorderableTripletLayout
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.minimumInteritemSpacing = 0
//        collectionViewLayout.itemSize = view.bounds.size
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)

        // collection view
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseIdenfitierString)
//        collectionView.  = true
        view.addSubview(collectionView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var frame = view.bounds
        frame.origin.y = view.safeAreaInsets.top
        frame.size.height -= frame.origin.y
        collectionView.frame = frame
    }

    // MARK: UICollectionViewDelegateFlowLayout

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return collectionView.frame.size
//    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdenfitierString, for: indexPath)
        cell.backgroundColor = UIColor.randomColor
        return cell
    }

}

extension  UIColor  {
    //返回随机颜色
    class  var  randomColor:  UIColor  {
        get  {
            let  red =  CGFloat (arc4random()%256)/255.0
            let  green =  CGFloat (arc4random()%256)/255.0
            let  blue =  CGFloat (arc4random()%256)/255.0
            return  UIColor (red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
