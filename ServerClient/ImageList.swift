//
//  ImageList.swift
//  hydref-2016-server
//
//  Created by Vincent Toms on 10/21/16.
//
//

import Foundation
import Genome

final class ImageList: BasicMappable {
    var images = [Image]()

    init() {

    }

    func sequence(_ map: Map) throws {
        try images <~> map["images"]
    }

    func like(id: Int) -> Bool {
        guard let index = images.index(where: { $0.id == id }) else {
            return false
        }

        images[index].voteCount += 1

        return true
    }
}
