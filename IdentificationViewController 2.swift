//
//  IdentificationViewController.swift
//  Registration
//
//  Created by Admin on 1/29/21.
//

import UIKit

class IdentificationViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Видео \nидентификация"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.numberOfLines = 2
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var labelSecond: UILabel = {
        let labelSecond = UILabel()
        labelSecond.text = "Подтвердите личность, чтобы стать клиентом Сбербанка."
        labelSecond.font = UIFont.systemFont(ofSize: 12)
        labelSecond.numberOfLines = 0
        labelSecond.textColor = .gray
        labelSecond.lineBreakMode = .byWordWrapping
        return labelSecond
    }()
    
    lazy var labelThird: UILabel = {
        let labelThird = UILabel()
        labelThird.text = "Распознавание лица. \nКак подтвердить личность?"
        labelThird.font = UIFont.systemFont(ofSize: 13)
        labelThird.numberOfLines = 0
        labelThird.textColor = .black
        labelThird.lineBreakMode = .byWordWrapping
        return labelThird
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердите личность", for: .normal)
        view.addSubview(button)
        button.backgroundColor = #colorLiteral(red: 0.1786435843, green: 0.5004600286, blue: 0.5479541421, alpha: 1)
        button.layer.cornerRadius = 27
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(labelSecond)
        view.addSubview(labelThird)
        
        title = ""
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron"), style: .plain, target: self, action: #selector(dismissSelf))
        
        setViewConstraints()
    }
    
//    @objc func didTapButton() {
//        let vc = FaceConfirmViewController()
//        vc.view.backgroundColor = .white
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapButton() {
        let rootVC = FaceConfirmViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    func setViewConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            label.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: -500),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        labelSecond.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            labelSecond.topAnchor.constraint(equalTo: label.bottomAnchor, constant: -900),
            labelSecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 72),
            labelSecond.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -72),
            labelSecond.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        labelThird.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            labelThird.topAnchor.constraint(equalTo: labelSecond.bottomAnchor, constant: -300),
            labelThird.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 104),
            labelThird.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -95),
            labelThird.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
