//
//  ViewController.swift
//  ServerClient
//
//  Created by Vincent Toms on 10/20/16.
//  Copyright © 2016 SwiftOfficeHours. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.getList()
    }


}

