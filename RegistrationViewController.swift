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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var myNewView: UIView = {
        let myNewView = UIView(frame: CGRect(x: 24, y: 203, width: view.frame.size.width / 1.135, height: 81))
        myNewView.backgroundColor = #colorLiteral(red: 0.9504194856, green: 0.9562203288, blue: 0.9692490697, alpha: 1)
        myNewView.layer.cornerRadius = 12
        labelSecond.addSubview(myNewView)
        return myNewView
    }()
    
    lazy var labelSecond: UILabel = {
        let labelSecond = UILabel()
        labelSecond.text = "Заполните поля, в которых \nукажите Ваш ИИН и номер мобильного \nтелефона."
        labelSecond.font = UIFont.systemFont(ofSize: 12)
        labelSecond.numberOfLines = 0
        labelSecond.textColor = .gray
        labelSecond.lineBreakMode = .byWordWrapping
        labelSecond.translatesAutoresizingMaskIntoConstraints = false
        return labelSecond
    }()
    
    lazy var imgView: UIImageView = {
       let imgView = UIImageView()
        imgView.frame = CGRect(x: 39, y: 220, width: 18, height: 18)
        imgView.image = UIImage(named: "ellipse")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите ИИН"
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setBottomBorder()
        return textField
    }()
    
    func personImage() {
        let leftImage = UIImageView(frame: CGRect(x: 0, y: 10, width: 14, height: 14))
        leftImage.tintColor = .black
        leftImage.image = UIImage(named: "person")
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        leftView.addSubview(leftImage)
        
        textField.leftViewMode = .always
        textField.leftView = leftView
    }
    
    lazy var textFieldSecond: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Мобильный телефон"
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setBottomBorder()
        return textField
    }()
    
    func mobileImage() {
        let leftImage = UIImageView(frame: CGRect(x: 0, y: 10, width: 14, height: 14))
        leftImage.tintColor = .black
        leftImage.image = UIImage(named: "call")
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        leftView.addSubview(leftImage)
        
        textFieldSecond.leftViewMode = .always
        textFieldSecond.leftView = leftView
    }
    
    lazy var labelThird: UILabel = {
        let labelThird = UILabel()
        labelThird.text = """
                          Нажимая "Продолжить", Вы даете согласие на сбор и обработку персональных данных
                          """
        labelThird.font = UIFont.systemFont(ofSize: 13)
        labelThird.numberOfLines = 0
        labelThird.textColor = .black
        labelThird.lineBreakMode = .byWordWrapping
        labelThird.translatesAutoresizingMaskIntoConstraints = false
        return labelThird
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        view.addSubview(button)
        button.backgroundColor = #colorLiteral(red: 0.1786435843, green: 0.5004600286, blue: 0.5479541421, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 27
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        view.addSubview(label)
        view.addSubview(myNewView)
        view.addSubview(labelSecond)
        view.addSubview(imgView)
        view.addSubview(labelThird)
        view.addSubview(textField)
        view.addSubview(textFieldSecond)
        view.addSubview(button)
        
        personImage()
        mobileImage()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        setViewConstraints()
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapButton() {
        let rootVC = NumberConfirmViewController()
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func setViewConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 91),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            labelSecond.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 45),
            labelSecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 72),
            labelSecond.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: labelSecond.bottomAnchor, constant: 68),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            textFieldSecond.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 47),
            textFieldSecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            textFieldSecond.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            labelThird.topAnchor.constraint(equalTo: button.topAnchor, constant: -65),
            labelThird.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 46),
            labelThird.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -46)
        ])
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
