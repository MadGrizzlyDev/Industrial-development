//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Pavel Belov on 21.05.2021.
//

import UIKit
import SnapKit

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
        
        self.addSubview(self.imageView)
        imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.height.equalTo(110)
            make.width.equalTo(110)
        }
        imageView.image = #imageLiteral(resourceName: "GrizzlyBear")
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        imageView.clipsToBounds = true
        
        
        self.addSubview(self.fullNameLabel)
        fullNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top).offset(27)
            make.leading.equalTo(self.imageView.snp.trailing).offset(16)
            make.height.equalTo(18)
        }
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.text = "Mad Grizzly"
        
        
        self.addSubview(self.statusLabel)
        statusLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.imageView.snp.trailing).offset(16)
            make.height.equalTo(14)
            make.top.equalTo(self.fullNameLabel.snp.bottom).offset(35)
        }
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = "Hungry"
        
        
        self.addSubview(self.setStatusButton)
        setStatusButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.imageView.snp.bottom).offset(32)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.height.equalTo(50)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
        }
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.layer.backgroundColor = UIColor.systemBlue.cgColor
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowOpacity = 0.7
        
        
        self.addSubview(self.statusTextField)
        statusTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.imageView.snp.trailing).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.bottom.equalTo(self.setStatusButton.snp.top).offset(-10)
            make.height.equalTo(40)
        }
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


