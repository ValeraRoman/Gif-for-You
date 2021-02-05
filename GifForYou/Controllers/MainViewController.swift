//
//  MainCollectionViewController.swift
//  GifForYou
//
//  Created by Macbook Air 13 on 05.02.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainViewController: UIViewController {
    
    
    var collectionView: UICollectionView!
    let gifModel = GifModel()
    
    private let sectionInsets = UIEdgeInsets(top: 10.0,
                                             left: 15.0,
                                             bottom: 10.0,
                                             right: 15.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifModel.getData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        setupCollectionView()
    }
    
    
    private func setupCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 700)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(GifCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    
}
// MARK: UICollectionViewDataSource



extension MainViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let result = gifModel.resultRequest else {
            return 0
        }
        return result.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.layer.cornerRadius = 20.0
        cell.backgroundColor = .red
        return cell
    }
    
    
}


extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let minimumItemSpacing: CGFloat = 10
        let paddingSpace = sectionInsets.left + sectionInsets.right + minimumItemSpacing * (itemsPerRow - 1)
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let itemSize = CGSize(width: widthPerItem, height: widthPerItem)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
    
}
