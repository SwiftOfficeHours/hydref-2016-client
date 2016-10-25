//
//  ImageItemCollectionViewCell.swift
//  ServerClient
//
//  Created by Vincent Toms on 10/23/16.
//  Copyright © 2016 SwiftOfficeHours. All rights reserved.
//

import UIKit
import AlamofireImage

class ImageItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var image: UIImageView!

    var itemImage: Image? {
        didSet {
            guard let url = URL(string: itemImage?.imageURL ?? "") else {
                dump(itemImage)
                return
            }
            image.af_setImage(withURL: url)

            title.text = itemImage?.title

            voteCount.text = "\(itemImage?.voteCount ?? 0)"
        }
    }
}
