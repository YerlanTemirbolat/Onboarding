//
//  ViewController.swift
//  Registration
//
//  Created by Admin on 1/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        view.addSubview(button)
        button.backgroundColor = #colorLiteral(red: 0.9504194856, green: 0.9562203288, blue: 0.9692490697, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 27
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "Зарегистрируйтесь как ИП или откройте счет"
        textView.font = UIFont.systemFont(ofSize: 12)
        textView.textAlignment = .center
        textView.textColor = .gray
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(registrationButton)
        view.addSubview(textView)
        
        setViewConstraints()
        
    }
    
//    @objc func didTapButton() {
//        let vc = ViewController()
//        vc.view.backgroundColor = .white
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapButton() {
        let rootVC = RegistrationViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    func setViewConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            registrationButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 550),
            registrationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            registrationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            registrationButton.heightAnchor.constraint(equalToConstant: 55)
        ]
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            textView.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 5),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}








