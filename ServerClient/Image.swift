//
//  Image.swift
//  hydref-2016-server
//
//  Created by Vincent Toms on 10/21/16.
//
//

import Foundation
import Genome

final class Image: BasicMappable {
    var id = 0
    var title = ""
    var voteCount = 0
    var imageURL = ""

    init() {

    }

    func sequence(_ map: Map) throws {
        try id <~> map["id"]
        try title <~> map["title"]
        try voteCount <~> map["count"]
        try imageURL <~> map["image"]
    }

}
