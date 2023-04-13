//
//  PostViewController.swift
//  Navigation
//
//  Created by Pavel Belov on 21.05.2021.
//

import UIKit
import StorageService

class PostViewController: UIViewController {
    
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = post?.title
    }
}
