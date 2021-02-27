//
//  IdentificationViewController.swift
//  Registration
//
//  Created by Admin on 1/29/21.
//

import UIKit
import OZLivenessSDK

class IdentificationViewController: UIViewController, OZVerificationDelegate {
    
    @available(iOS 11.0, *)
    func onOZVerificationResult(results: [OZVerificationResult]) {
        
        OZSDK.analyse(
            results: results,
            analyseStates: [.quality],
            fileUploadProgress: { (progress) in
                // completion
                
            }) { (resolution, error) in
                // resolution
                
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Видео \nидентификация"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.numberOfLines = 2
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var myNewView: UIView = {
        let myNewView = UIView(frame: CGRect(x: 24, y: 204, width: view.frame.size.width / 1.135, height: 66))
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
        labelSecond.text = "Подтвердите личность, чтобы стать \nклиентом Сбербанка."
        labelSecond.font = UIFont.systemFont(ofSize: 12)
        labelSecond.numberOfLines = 0
        labelSecond.textColor = .gray
        labelSecond.lineBreakMode = .byWordWrapping
        return labelSecond
    }()
    
    lazy var labelThird: UILabel = {
        let labelThird = UILabel()
        labelThird.text = """
                              Распознавание лица.
                          Как подтвердить личность?
                          """
        labelThird.font = UIFont.systemFont(ofSize: 13)
        labelThird.numberOfLines = 0
        labelThird.textColor = .black
        labelThird.lineBreakMode = .byWordWrapping
        return labelThird
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердить личность", for: .normal)
        view.addSubview(button)
        button.backgroundColor = #colorLiteral(red: 0.1786435843, green: 0.5004600286, blue: 0.5479541421, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 27
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
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
        view.addSubview(imgView)
        view.addSubview(labelSecond)
        view.addSubview(labelThird)
        view.addSubview(button)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        setViewConstraints()
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapButton() {
        let rootVC = FaceConfirmViewController()
        navigationController?.pushViewController(rootVC, animated: true)
        onPost()
        
        if #available(iOS 11.0, *) {
            let actions: [OZVerificationMovement] = [.scanning, .smile, .far]
            let ozLivenessVC: UIViewController = OZSDK.createVerificationVCWithDelegate(self, actions: actions)
            self.present(ozLivenessVC, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
     
    func onPost() {
        
        let parameters = ["login": "aleksandr.kokshin@sberbank.kz", "password": "yWrUKSx"]
        
        guard let url = URL(string: "https://web.oz-services.ru/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
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
            labelSecond.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 48),
            labelSecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 72),
            labelSecond.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
        ]
        
        labelThird.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            labelThird.topAnchor.constraint(equalTo: button.topAnchor, constant: -65),
            labelThird.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 104),
            labelThird.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -95),
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
