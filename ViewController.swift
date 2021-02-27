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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var textView: UILabel = {
        let textView = UILabel()
        textView.text = "Зарегистрируйтесь как ИП или откройте счет"
        textView.font = UIFont.systemFont(ofSize: 12)
        textView.textAlignment = .center
        textView.textColor = .gray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(registrationButton)
        view.addSubview(textView)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        setViewConstraints()
        
    }
    
    @objc func didTapButton() {
        let rootVC = RegistrationViewController()
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func setViewConstraints() {
        NSLayoutConstraint.activate([
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            registrationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            registrationButton.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -10),
            registrationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            registrationButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
