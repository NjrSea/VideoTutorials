//
//  ViewDemoViewController.swift
//  ViewControllerDemo
//
//  Created by wang ya on 2021/7/19.
//

import UIKit

class ViewDemoViewController: UIViewController {

    private let viewA: UIView = UIView()
    private let buttonA: UIButton = UIButton(type: UIButton.ButtonType.infoLight)

    override func viewDidLoad() {
        super.viewDidLoad()

        viewA.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.addSubview(viewA)

        viewA.layer.borderWidth = 10
        viewA.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor
        viewA.layer.cornerRadius = 50
        viewA.layer.masksToBounds = true

        // 手势识别
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(gestureRecognizer:)))
        viewA.addGestureRecognizer(tapGesture)
//        viewA.isUserInteractionEnabled = false
//        viewA.alpha = 0
//        viewA.isHidden = true

        // 按钮
        buttonA.addTarget(self, action: #selector(buttonClicked(button:)), for: UIControl.Event.touchDragEnter)
        view.addSubview(buttonA)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewA.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: 300, height: 300)
        buttonA.frame = CGRect(x: 100, y: view.safeAreaInsets.top + 350, width: 40, height: 40)
    }

    @objc private func tapGesture(gestureRecognizer: UIGestureRecognizer) {

    }

    @objc private func buttonClicked(button: UIButton) {

    }

    @IBAction func switchClicked(_ sender: UISwitch) {
        print("switch \(sender.isOn)")
    }


}
