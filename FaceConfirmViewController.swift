//
//  FaceConfirmViewController.swift
//  Registration
//
//  Created by Admin on 1/29/21.
//

import UIKit

class FaceConfirmViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Отменить", for: .normal)
        view.addSubview(button)
        button.backgroundColor = #colorLiteral(red: 0.1786435843, green: 0.5004600286, blue: 0.5479541421, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 27
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "face")
        imageView.contentMode = .scaleAspectFill
        self.view.insertSubview(imageView, at: 0)
        return imageView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "chevron"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(imageView)
        view.addSubview(button)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)

        setViewConstraints()
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapButton() {
        let rootVC = DocumentViewController()
        navigationController?.pushViewController(rootVC, animated: true)
    }

    func setViewConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            imageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        
        button.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 55)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
