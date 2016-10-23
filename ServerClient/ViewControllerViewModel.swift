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

    

    func getList() {
        Alamofire.request("http://localhost:8080/list")
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if (response.result.error == nil) {
                    debugPrint("HTTP Response Body: \(response.data)")
                    do {
                        let list = try ImageList(node: response.data)
                        dump(list)
                    } catch {
                        print(error)
                    }
                } else {
                    debugPrint("HTTP Request failed: \(response.result.error)")
                }
        }
    }


}
