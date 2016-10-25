//
//  ViewControllerViewModel.swift
//  ServerClient
//
//  Created by Vincent Toms on 10/22/16.
//  Copyright © 2016 SwiftOfficeHours. All rights reserved.
//

import Foundation
import Alamofire

final class ViewControllerViewModel {

    var imageList: ImageList? = nil

    subscript(index: Int) -> Image {
        get {
            return imageList?.images[index] ?? Image()
        }
    }

    func voteItem(at: Int, completion: @escaping (Void) -> Void) {
        let image = self[at]

        Alamofire.request("http://localhost:8080/like/\(image.id)", method: .post)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            self.getList(completion: completion)
        }
    }

    func getList(completion: @escaping (Void) -> Void) {
        Alamofire.request("http://localhost:8080/list")
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            defer {
                completion()
            }
            if (response.result.error == nil) {
                debugPrint("HTTP Response Body: \(response.data)")
                do {
                    self.imageList = try ImageList(node: response.data)
                    dump(self.imageList)
                } catch {
                    print(error)
                }
            } else {
                debugPrint("HTTP Request failed: \(response.result.error)")
            }
        }
    }

    func itemCount() -> Int {
        return imageList?.images.count ?? 0
    }


}
