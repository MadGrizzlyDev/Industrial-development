//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Pavel Belov on 21.05.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let imageView = UIImageView()
    private let fullNameLabel = UILabel()
    private let statusLabel = UILabel()
    private let setStatusButton = UIButton()
    private let statusTextField = UITextField()
    private var statusText = String()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override init (frame: CGRect) {
        super.init (frame: frame)
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                                        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                                        imageView.heightAnchor.constraint(equalToConstant: 110),
                                        imageView.widthAnchor.constraint(equalToConstant: 110)])
        
        imageView.image = #imageLiteral(resourceName: "GrizzlyBear")
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        imageView.clipsToBounds = true
        
        
        self.addSubview(fullNameLabel)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
                                        fullNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                                        fullNameLabel.heightAnchor.constraint(equalToConstant: 18)])
        
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.text = "Mad Grizzly"
        
        
        
        self.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        statusLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                                        statusLabel.heightAnchor.constraint(equalToConstant: 14),
                                        statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 35)])
        
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = "Hungry"
        
        
        self.addSubview(setStatusButton)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        setStatusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
                                        setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                                        setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                                        setStatusButton.heightAnchor.constraint(equalToConstant: 50),
                                        setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)])
        
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.layer.backgroundColor = UIColor.systemBlue.cgColor
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowOpacity = 0.7
        
        
        self.addSubview(statusTextField)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        statusTextField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                                        statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                                        statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
                                        statusTextField.heightAnchor.constraint(equalToConstant: 40)])
        
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.backgroundColor = .white
        statusTextField.clipsToBounds = true
        statusTextField.addTarget(self, action: #selector(changeStatus), for: .editingChanged)
    }
    
    @objc func changeStatus(_ statusField: UITextField) {
        statusText = statusTextField.text ?? "No status"
    }
    
    @objc func onButton() {
        statusLabel.text = statusText
        print("Status:", statusLabel.text ?? "No status")
    }
}

