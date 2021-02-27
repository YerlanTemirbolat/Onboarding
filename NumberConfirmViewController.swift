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
    
    lazy var imgView: UIImageView = {
       let imgView = UIImageView()
        imgView.frame = CGRect(x: 39, y: 220, width: 18, height: 18)
        imgView.image = UIImage(named: "ellipse")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    lazy var labelSecond: UILabel = {
        let labelSecond = UILabel()
        labelSecond.text = """
                           Введите СМС код. Отправленный на номер +7 *** *** ** 00. Повторить отправку можно через 1 минуту 59 секунд
                           """
        labelSecond.font = UIFont.systemFont(ofSize: 12)
        labelSecond.numberOfLines = 0
        labelSecond.textColor = .gray
        labelSecond.lineBreakMode = .byWordWrapping
        labelSecond.translatesAutoresizingMaskIntoConstraints = false
        return labelSecond
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердить", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1786435843, green: 0.5004600286, blue: 0.5479541421, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(button)
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
        
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(myNewView)
        view.addSubview(imgView)
        view.addSubview(labelSecond)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        setViewConstraints()
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapButton() {
        let rootVC = IdentificationViewController()
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
  
    
    func setViewConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 91),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
        ]
        
        labelSecond.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            labelSecond.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            labelSecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 72),
            labelSecond.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
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
