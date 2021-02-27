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
    
    lazy var labelSecond: UILabel = {
        let labelSecond = UILabel()
        labelSecond.text = "Для авторизации и входа в приложение придумайте пароль."
        labelSecond.font = UIFont.systemFont(ofSize: 12)
        labelSecond.numberOfLines = 0
        labelSecond.textColor = .gray
        labelSecond.lineBreakMode = .byWordWrapping
        return labelSecond
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(label)
        view.addSubview(labelSecond)
        
        title = ""
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron"), style: .plain, target: self, action: #selector(dismissSelf))
        
        setViewConstraints()
    }
    
//    @objc func didTapButton() {
//        let vc = CreatePasswordViewController()
//        vc.view.backgroundColor = .white
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapButton() {
        let rootVC = CreatePasswordViewController()
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
        
        NSLayoutConstraint.activate(constraints)
    }
}
    
    
