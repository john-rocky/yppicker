//
//  ViewController.swift
//  yppicker
//
//  Created by 間嶋大輔 on 2022/05/23.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {
    var items: [YPMediaPhoto] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var config = YPImagePickerConfiguration()
        config.library.maxNumberOfItems = 72
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                    
                case .photo(let photo):
                    self.items.append(photo)

                    let image = photo.image
                    print(self.items.count)
                case .video(let video):
                    print(video)
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
        self.navigationController?.present(picker, animated: true)
    }
}

