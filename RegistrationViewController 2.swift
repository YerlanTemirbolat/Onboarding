//
//  RegistrationViewController.swift
//  Registration
//
//  Created by Admin on 1/29/21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Регистрация \nпользователя"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.numberOfLines = 2
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var labelSecond: UILabel = {
        let labelSecond = UILabel()
        labelSecond.text = "Заполните поля, в которых \nукажите Ваш ИНН и номер мобильного телефона."
        labelSecond.font = UIFont.systemFont(ofSize: 12)
        labelSecond.numberOfLines = 0
        labelSecond.textColor = .gray
        labelSecond.lineBreakMode = .byWordWrapping
        return labelSecond
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите ИНН"
        textField.borderStyle = .none
        return textField
    }()
    
    lazy var textField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Мобильный телефон"
        textField.borderStyle = .none
        return textField
    }()
    
    lazy var labelThird: UILabel = {
        let labelThird = UILabel()
        labelThird.text = "Нажимая Продолжить, Вы даете согласие на сбор и обработку персональных данных"
        labelThird.font = UIFont.systemFont(ofSize: 13)
        labelThird.numberOfLines = 0
        labelThird.textColor = .black
        labelThird.lineBreakMode = .byWordWrapping
        return labelThird
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
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
        
        view.addSubview(label)
        view.addSubview(labelSecond)
        view.addSubview(labelThird)
        view.addSubview(textField)
        view.addSubview(textField2)
        view.addSubview(button)
        
        title = ""
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron"), style: .plain, target: self, action: #selector(dismissSelf))
        
        setViewConstraints()
    }

//    @objc func didTapButton() {
//        let vc = NumberConfirmViewController()
//        vc.view.backgroundColor = .white
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapButton() {
        let rootVC = NumberConfirmViewController()
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
            labelThird.topAnchor.constraint(equalTo: labelSecond.bottomAnchor, constant: -320),
            labelThird.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            labelThird.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            labelThird.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            textField.topAnchor.constraint(equalTo: labelSecond.bottomAnchor, constant: -750),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            textField.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        textField2.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            textField2.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: -600),
            textField2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            textField2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            textField2.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
