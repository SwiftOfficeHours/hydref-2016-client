//
//  ViewController.swift
//  ServerClient
//
//  Created by Vincent Toms on 10/20/16.
//  Copyright © 2016 SwiftOfficeHours. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    let viewModel = ViewControllerViewModel()

    fileprivate let identifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(UINib(nibName: "ImageItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)

        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsetsMake(0,15,0,15)

        collectionView?.setCollectionViewLayout(layout, animated: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.getList {
            self.collectionView?.reloadData()
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemCount()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ImageItemCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.itemImage = viewModel[indexPath.row]

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.voteItem(at: indexPath.row) {
            self.collectionView?.reloadData()
        }
    }

    

}

