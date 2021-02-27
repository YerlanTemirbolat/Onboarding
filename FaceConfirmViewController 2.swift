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


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(imageView)
        view.addSubview(button)

        title = ""

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron"), style: .plain, target: self, action: #selector(dismissSelf))

        setViewConstraints()
    }

//    @objc func didTapButton() {
//        let vc = DocumentViewController()
//        vc.view.backgroundColor = .white
//        navigationController?.pushViewController(vc, animated: true)
//    }

    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

    @objc func didTapButton() {
        let rootVC = DocumentViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
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
            button.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 500),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 55)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
