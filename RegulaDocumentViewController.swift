////
////  RegulaDocumentViewController.swift
////  Registration
////
////  Created by Admin on 2/25/21.
////
//
//import Foundation
//import UIKit
////import FaceSDK
//import Photos
//
//class RegulaDocumentViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
//
//    lazy var firtImageView: UIImageView = {
//       let imgView = UIImageView()
//        imgView.frame = CGRect(x: 39, y: 220, width: 18, height: 18)
//        imgView.image = UIImage(named: "ellipse")
//        imgView.contentMode = .scaleAspectFit
//        return imgView
//    }()
//
//    lazy var secondImageView: UIImageView = {
//       let imgView = UIImageView()
//        imgView.frame = CGRect(x: 39, y: 220, width: 18, height: 18)
//        imgView.image = UIImage(named: "ellipse")
//        imgView.contentMode = .scaleAspectFit
//        return imgView
//    }()
//
//    lazy var matchFacesButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Match faces", for: .normal)
//        view.addSubview(button)
//        button.backgroundColor = #colorLiteral(red: 0.1786435843, green: 0.5004600286, blue: 0.5479541421, alpha: 1)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        button.layer.cornerRadius = 27
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(startMatchFaces), for: .touchUpInside)
//        return button
//    }()
//
//    lazy var livenessButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Liveness", for: .normal)
//        view.addSubview(button)
//        button.backgroundColor = #colorLiteral(red: 0.1786435843, green: 0.5004600286, blue: 0.5479541421, alpha: 1)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        button.layer.cornerRadius = 27
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(startLiveness), for: .touchUpInside)
//        return button
//    }()
//
//    lazy var clearButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Clear", for: .normal)
//        view.addSubview(button)
//        button.backgroundColor = #colorLiteral(red: 0.1786435843, green: 0.5004600286, blue: 0.5479541421, alpha: 1)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        button.layer.cornerRadius = 27
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(clear), for: .touchUpInside)
//        return button
//    }()
//
//    lazy var similarityLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Similarity: nil"
//        label.font = UIFont.boldSystemFont(ofSize: 35)
//        label.numberOfLines = 2
//        label.textColor = .black
//        label.lineBreakMode = .byWordWrapping
//        return label
//    }()
//
//    lazy var livenessLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Liveness: nil"
//        label.font = UIFont.boldSystemFont(ofSize: 35)
//        label.numberOfLines = 2
//        label.textColor = .black
//        label.lineBreakMode = .byWordWrapping
//        return label
//    }()
//
//    var imagePicker = UIImagePickerController()
//    var currentImageView = UIImageView()
//
//    var strSimilarity = "Similarity: nil"
//    var strLiveness = "Liveness: nil"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let tapGestureFirst = UITapGestureRecognizer(target: self, action: #selector(RegulaDocumentViewController.imageTapped(gesture:)))
//        firtImageView.addGestureRecognizer(tapGestureFirst)
//        firtImageView.isUserInteractionEnabled = true
//
//        let tapGestureSecond = UITapGestureRecognizer(target: self, action: #selector(RegulaDocumentViewController.imageTapped(gesture:)))
//        secondImageView.addGestureRecognizer(tapGestureSecond)
//        secondImageView.isUserInteractionEnabled = true
//
//        similarityLabel.text = strSimilarity
//        livenessLabel.text = strLiveness
//
//        setViewConstraints()
//    }
//
//    @objc func imageTapped(gesture: UIGestureRecognizer) {
//        if (gesture.view as? UIImageView) != nil {
//            showActions(controller: self, imageView: (gesture.view as? UIImageView)!)
//        }
//    }
//
//    func showActions(controller: UIViewController, imageView: UIImageView) {
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {_ in
//            self.startFaceCaptureVC(controller: self, imageView: imageView)
//        }))
//        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {_ in
//            self.currentImageView = imageView
//            imageView.tag = ImageType.printed.rawValue
//            self.pickImage(sourceType: .photoLibrary)
//        }))
//        alert.addAction(UIAlertAction(title: "Camera shoot", style: .default, handler: {_ in
//            self.currentImageView = imageView
//            imageView.tag = ImageType.live.rawValue
//            self.pickImage(sourceType: .camera)
//        }))
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        if let popoverPresentationController = alert.popoverPresentationController {
//            popoverPresentationController.sourceView = view
//            popoverPresentationController.sourceRect = CGRect(x: imageView.frame.midX, y: imageView.frame.midY, width: 0, height: 0)
//        }
//        self.present(alert, animated: true, completion: nil)
//    }
//
//    func startFaceCaptureVC(controller: UIViewController, imageView: UIImageView) {
//        Face.service.presentCaptureViewController(from: controller, animated: true, onCapture: { (faceCaptureResponse: FaceCaptureResponse?) in
//            if let faceCaptureResponse = faceCaptureResponse {
//                if let image = faceCaptureResponse.image {
//                    imageView.image = image.image
//                    imageView.tag = ImageType.live.rawValue
//                }
//            }
//        }, completion: nil)
//    }
//
//    @objc func startMatchFaces() {
//        var matchRequestImages = [Image]()
//
//        if firtImageView.image != nil && secondImageView.image != nil {
//            let firstImage = Image(image: firtImageView.image!)
//            firstImage.imageType = ImageType(rawValue: firtImageView.tag) ?? .printed
//            matchRequestImages.append(firstImage)
//
//            let secondImage = Image(image: secondImageView.image!)
//            secondImage.imageType = ImageType(rawValue: secondImageView.tag) ?? .printed
//            matchRequestImages.append(secondImage)
//
//            let request = MatchFacesRequest(images: matchRequestImages)
//
//            self.similarityLabel.text = "Processing..."
//            self.matchFacesButton.isEnabled = false
//            self.livenessButton.isEnabled = false
//            self.clearButton.isEnabled = false
//
//            Face.service.matchFaces(request, completion: { (response: MatchFacesResponse?) in
//                self.matchFacesButton.isEnabled = true
//                self.livenessButton.isEnabled = true
//                self.clearButton.isEnabled = true
//
//                if let response = response {
//                    if let matchedFaces = response.matchedFaces.first {
//                        let similarity = "Similarity: " + String(format: "%.2f", Double(truncating: matchedFaces.similarity) * 100) + "%"
//                        self.similarityLabel.text = similarity
//                    } else {
//                        self.similarityLabel.text = "Similarity: error"
//                    }
//                    print(response)
//                } else {
//                    let alert = UIAlertController(title: "No response", message: nil, preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//                    print("No response")
//                }
//            })
//
//        } else {
//            let alert = UIAlertController(title: "Having both images are compulsory", message: nil, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//
//    @objc func startLiveness() {
//        Face.service.startLiveness(from: self, animated: true) { (livenessResponse: LivenessResponse?) in
//            if let livenessResponse = livenessResponse {
//                self.firtImageView.image = livenessResponse.image
//                self.firtImageView.tag = ImageType.live.rawValue
//
//                let livenessStatus = livenessResponse.liveness == .passed ? "Liveness: passed" : "Liveness: unknown"
//                self.livenessLabel.text = livenessStatus
//                self.similarityLabel.text = "Similarity: nil"
//            } else {
//                print("No response")
//            }
//        } completion: {
//            print("Liveness completed")
//        }
//    }
//
//    @objc func clear() {
//        self.firtImageView.image = nil
//        self.secondImageView.image = nil
//        self.similarityLabel.text = strSimilarity
//        self.livenessLabel.text = strLiveness
//    }
//
//    func pickImage(sourceType: UIImagePickerController.SourceType) {
//        PHPhotoLibrary.requestAuthorization { (status) in
//            switch status {
//            case .authorized:
//                if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
//                  DispatchQueue.main.async {
//                    self.imagePicker.delegate = self
//                    self.imagePicker.sourceType = sourceType;
//                    self.imagePicker.allowsEditing = false
//                    self.imagePicker.navigationBar.tintColor = .black
//                    self.present(self.imagePicker, animated: true, completion: nil)
//                  }
//                }
//            case .denied:
//                let message = NSLocalizedString("Application doesn't have permission to use the camera, please change privacy settings", comment: "Alert message when the user has denied access to the gallery")
//                let alertController = UIAlertController(title: NSLocalizedString("Gallery Unavailable", comment: "Alert eror title"), message: message, preferredStyle: .alert)
//                alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Alert manager, OK button tittle"), style: .cancel, handler: nil))
//                alertController.addAction(UIAlertAction(title: NSLocalizedString("Settings", comment: "Alert button to open Settings"), style: .default, handler: { action in
//                    if #available(iOS 10.0, *) {
//                        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
//                        UIApplication.shared.open(settingsURL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
//                    } else {
//                        UIApplication.shared.openURL(URL(string: UIApplication.openSettingsURLString)!)
//                    }
//                }))
//                self.present(alertController, animated: true, completion: nil)
//                print("PHPhotoLibrary status: denied")
//                break
//            case .notDetermined:
//                print("PHPhotoLibrary status: notDetermined")
//            case .restricted:
//                print("PHPhotoLibrary status: restricted")
//            case .limited:
//                print("PHPhotoLibrary status: Limited")
//            @unknown default:
//                fatalError()
//            }
//        }
//    }
//
//    func setViewConstraints() {
//        var constraints = [NSLayoutConstraint]()
//
//        firtImageView.translatesAutoresizingMaskIntoConstraints = false
//        constraints += [
//            firtImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
//            firtImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
//            firtImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
//        ]
//
//        secondImageView.translatesAutoresizingMaskIntoConstraints = false
//        constraints += [
//            secondImageView.topAnchor.constraint(equalTo: firtImageView.bottomAnchor, constant: 25),
//            secondImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
//            secondImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
//        ]
//
//        matchFacesButton.translatesAutoresizingMaskIntoConstraints = false
//        constraints += [
//            matchFacesButton.topAnchor.constraint(equalTo: secondImageView.topAnchor, constant: 30),
//            matchFacesButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
//            matchFacesButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
//            matchFacesButton.heightAnchor.constraint(equalToConstant: 55)
//        ]
//
//        livenessButton.translatesAutoresizingMaskIntoConstraints = false
//        constraints += [
//            livenessButton.topAnchor.constraint(equalTo: matchFacesButton.topAnchor, constant: 30),
//            livenessButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
//            livenessButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
//            livenessButton.heightAnchor.constraint(equalToConstant: 55)
//        ]
//
//        clearButton.translatesAutoresizingMaskIntoConstraints = false
//        constraints += [
//            clearButton.topAnchor.constraint(equalTo: livenessButton.topAnchor, constant: 30),
//            clearButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
//            clearButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
//            clearButton.heightAnchor.constraint(equalToConstant: 55)
//        ]
//
//        similarityLabel.translatesAutoresizingMaskIntoConstraints = false
//        constraints += [
//            similarityLabel.topAnchor.constraint(equalTo: clearButton.topAnchor, constant: 30),
//            similarityLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
//            similarityLabel.rightAnchor.constraint(equalTo: livenessLabel.rightAnchor, constant: -30),
//            similarityLabel.heightAnchor.constraint(equalToConstant: 55)
//        ]
//
//        livenessLabel.translatesAutoresizingMaskIntoConstraints = false
//        constraints += [
//            livenessLabel.topAnchor.constraint(equalTo: clearButton.topAnchor, constant: 30),
//            livenessLabel.leftAnchor.constraint(equalTo: similarityLabel.leftAnchor, constant: 30),
//            livenessLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
//            livenessLabel.heightAnchor.constraint(equalToConstant: 55)
//        ]
//
//        NSLayoutConstraint.activate(constraints)
//    }
//}
//
//extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
//
//        if let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage {
//            self.dismiss(animated: true, completion: {
//                //self.currentImageView.image = image
//            })
//        } else {
//            self.dismiss(animated: true, completion: nil)
//            print("Something went wrong")
//        }
//    }
//}
//
//fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
//    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
//}
//
//fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
//    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
//}
//
//fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
//    return input.rawValue
//}
