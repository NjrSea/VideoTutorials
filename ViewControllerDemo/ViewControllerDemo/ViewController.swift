//
//  ViewController.swift
//  ViewControllerDemo
//
//  Created by wang ya on 2021/7/8.
//

import UIKit
import CropViewController

//class XibViewController: UIViewController {
//
//}

class ViewController: UIViewController {



    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(#function)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#function)
    }

    override func loadView() {
        super.loadView()
        print(#function)
    }

    static var didShowNewVC = false

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)

        if !ViewController.didShowNewVC {
            ViewController.didShowNewVC = true
            let vc = ViewController(nibName: "View", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }

    deinit {
        print(#function)
    }

    @IBAction func onButtonClick(_ sender: Any) {
        let image = UIImage(named: "image1")!
        let vc = CropViewController(croppingStyle: CropViewCroppingStyle.default, image: image)
        present(vc, animated: true, completion: nil)
    }
}

