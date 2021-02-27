//
//  CreatePasswordViewController.swift
//  Registration
//
//  Created by Admin on 1/29/21.
//

import UIKit

class CreatePasswordViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Придумайте \nпароль"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.numberOfLines = 2
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var myNewView: UIView = {
        let myNewView = UIView(frame: CGRect(x: 24, y: 203, width: view.frame.size.width / 1.135, height: 65))
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
        labelSecond.text = "Для авторизации и входа в приложение придумайте пароль."
        labelSecond.font = UIFont.systemFont(ofSize: 12)
        labelSecond.numberOfLines = 0
        labelSecond.textColor = .gray
        labelSecond.lineBreakMode = .byWordWrapping
        return labelSecond
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
        view.addSubview(imgView)
        view.addSubview(labelSecond)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        setViewConstraints()
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapButton() {
        let rootVC = CreatePasswordViewController()
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
            labelSecond.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 45),
            labelSecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 72),
            labelSecond.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
    
    
