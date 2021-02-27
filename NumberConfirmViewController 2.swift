//
//  NumberConfirmViewController.swift
//  Registration
//
//  Created by Admin on 1/29/21.
//

import UIKit

class NumberConfirmViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Подтвердите \nномер"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.numberOfLines = 2
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var labelSecond: UILabel = {
        let labelSecond = UILabel()
        labelSecond.text = "Введите СМС код. Отправленный на номер +7 *** *** ** 00. Повторить отправку можно через 1 минуту 59 секунд"
        labelSecond.font = UIFont.systemFont(ofSize: 12)
        labelSecond.numberOfLines = 0
        labelSecond.textColor = .gray
        labelSecond.lineBreakMode = .byWordWrapping
        return labelSecond
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1786435843, green: 0.5004600286, blue: 0.5479541421, alpha: 1)
        view.addSubview(button)
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
        
        title = ""
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron"), style: .plain, target: self, action: #selector(dismissSelf))
        
        setViewConstraints()
    }
    
//    @objc func didTapButton() {
//        let vc = IdentificationViewController()
//        vc.view.backgroundColor = .white
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapButton() {
        let rootVC = IdentificationViewController()
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
