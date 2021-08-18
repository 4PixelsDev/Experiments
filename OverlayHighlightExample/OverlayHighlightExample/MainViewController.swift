//
//  ViewController.swift
//  OverlayHighlightExample
//
//  Created by Igor Stojanovic on 8/18/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    private var overlay: OverlayVIew?

    private var elementIndex = 0

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createOverlay(for: buttons[elementIndex])
    }

    @objc func nextElement() {
        elementIndex = (elementIndex + 1) % 3
        createOverlay(for: buttons[elementIndex])
    }

    private func createOverlay(for element: UIView) {
        overlay = OverlayVIew(with: element, onTap: nextElement)
        overlay?.frame = view.bounds
        view.addSubview(overlay!)
        self.overlay?.highlight()
    }
}

