//
//  ViewController.swift
//  Casini
//
//  Created by Ehsanul Karim on 22/7/25.
//

import UIKit

class ViewController: VCLLoggingViewController {
    
    private var myImgae: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    var imageUrl : URL? {
        didSet {
            myImgae = nil

            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private func fetchImage() {
        guard let url = imageUrl else { return }
        
        let urlContents = try? Data(contentsOf: url)
        if let imageData = urlContents {
            myImgae = UIImage(data: imageData)
        }
    }

    @IBOutlet var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    var imageView: UIImageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if imageUrl == nil {
            imageUrl = DemoURLs.stanford
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
