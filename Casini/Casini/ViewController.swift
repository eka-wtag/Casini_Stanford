//
//  ViewController.swift
//  Casini
//
//  Created by Ehsanul Karim on 22/7/25.
//

import UIKit

class ViewController: UIViewController {
    
    var imageUrl : URL? {
        didSet {
            imageView.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private func fetchImage() {
        guard let url = imageUrl else { return }
        
        let urlContents = try? Data(contentsOf: url)
        if let imageData = urlContents {
            imageView.image = UIImage(data: imageData)
        }
        
    }

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if imageUrl == nil {
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
}

