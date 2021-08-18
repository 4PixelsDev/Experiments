//
//  OverlayView.swift
//  OverlayHighlightExample
//
//  Created by Igor Stojanovic on 8/18/21.
//

import UIKit

class OverlayVIew: UIView {

    weak var view: UIView?
    private var onTap: ()->Void

    init(with view: UIView, onTap:@escaping ()->Void) {
        self.view = view
        self.onTap = onTap
        super.init(frame: .zero)
        setup()
    }

    private func setup() {
        self.backgroundColor = .gray
        self.alpha = 0.5
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOverlay))
        self.addGestureRecognizer(tapGesture)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func didTapOverlay() {
        self.removeFromSuperview()
        onTap()
    }


    func highlight() {
        guard let highlightView = view,
              let parentView = highlightView.superview,
              let clonedView = highlightView.snapshotView(afterScreenUpdates:false) else {
            return
        }

        let translatedOrigin = parentView.convert(highlightView.frame.origin, to: self)
        clonedView.frame = CGRect(origin: translatedOrigin, size: highlightView.bounds.size)

        addSubview(clonedView)
    }
}
