//
//  ScrollViewDemoViewController.swift
//  ViewControllerDemo
//
//  Created by wang ya on 2021/7/26.
//

import UIKit

class ScrollViewDemoViewController: UIViewController, UIScrollViewDelegate {

    private let scrollView: UIScrollView = UIScrollView()
    private let image = UIImage(named: "image1")!
    private lazy var imageView = { () -> UIImageView in
        let imageView = UIImageView(image: self.image)
        return imageView
    }()

    private var currentImageSize: CGSize {
        let scale = scrollView.zoomScale
        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
    }

    private var didFinishInitialLayout = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false

        scrollView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        scrollView.delegate = self

        scrollView.addSubview(imageView)
        scrollView.contentSize = image.size

        // zoom
        let miniScale: CGFloat
        if image.size.width > image.size.height {
            miniScale = view.frame.width / image.size.width
        } else {
            miniScale = view.frame.height / image.size.height
        }
        scrollView.minimumZoomScale = miniScale
        scrollView.maximumZoomScale = 3
        scrollView.zoomScale = miniScale

        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = true

        // 隐藏滚动条
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false

        // 添加缩放手势
        let gesture = UITapGestureRecognizer(target: self, action: #selector(toggleZoom))
        gesture.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(gesture)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame.size = view.frame.size
        scrollView.frame.origin.y = view.safeAreaInsets.top
        scrollView.frame.size.height -= view.safeAreaInsets.top + view.safeAreaInsets.bottom

        if !didFinishInitialLayout {
            // content inset
            let top: CGFloat = (scrollView.frame.height - currentImageSize.height) / 2
            scrollView.contentInset = UIEdgeInsets(top: top, left: 100, bottom: 0, right: 0)

            didFinishInitialLayout = true
        }
    }

    // MARK: Private

    @objc private func toggleZoom() {
        if scrollView.zoomScale <= 1 {
//            scrollView.zoomScale = scrollView.maximumZoomScale
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        } else {
//            scrollView.zoomScale = scrollView.minimumZoomScale
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        }
    }

    // MARK: UIScrollViewDelegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("did scroll  isDragging:\(scrollView.isDragging)  isTracking:\(scrollView.isTracking)")
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        // content inset
        let top: CGFloat = max(0, (scrollView.frame.height - currentImageSize.height) / 2)
        scrollView.contentInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
