//
//  LogInViewController.swift
//  Navigation
//
//  Created by Pavel Belov on 07.06.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let scroll = UIScrollView()
    private let mainView = UIView()
    private let logo = UIImageView(image: UIImage(named: "LogoVK"))
    private let loginView = UIView()
    private let login = UITextField()
    private let password = UITextField()
    private let loginButton = UIButton()
    private let pixelNormal = UIImage(named: "blue_pixel")
    private let pixelSelected = UIImage(named: "pixelSelected")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        
        view.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        scroll.topAnchor.constraint(equalTo: view.topAnchor),
                                        scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                        scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                        scroll.heightAnchor.constraint(equalTo: view.heightAnchor),
                                        scroll.widthAnchor.constraint(equalTo: view.widthAnchor)])
        
        
        scroll.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        mainView.topAnchor.constraint(equalTo: scroll.topAnchor),
                                        mainView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
                                        mainView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
                                        mainView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
                                        mainView.heightAnchor.constraint(equalTo: scroll.heightAnchor),
                                        mainView.widthAnchor.constraint(equalTo: scroll.widthAnchor)])
        
        
        mainView.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([logo.widthAnchor.constraint(equalToConstant: 100),
                                     logo.heightAnchor.constraint(equalToConstant: 100),
                                     logo.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor),
                                     logo.topAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.topAnchor, constant: 120)])
        
        
        mainView.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        loginView.topAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.topAnchor, constant: 340),
                                        loginView.heightAnchor.constraint(equalToConstant: 100),
                                        loginView.leadingAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                                        loginView.trailingAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.trailingAnchor, constant: -16)])
        
        loginView.layer.cornerRadius = 10
        loginView.layer.borderWidth = 0.5
        loginView.layer.borderColor = UIColor.lightGray.cgColor
        self.loginView.clipsToBounds = true
        
        
        loginView.addSubview(login)
        login.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        login.topAnchor.constraint(equalTo: self.logo.bottomAnchor, constant: 120),
                                        login.heightAnchor.constraint(equalToConstant: 50),
                                        login.leadingAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                                        login.trailingAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.trailingAnchor, constant: -16)])
        
        login.backgroundColor = .systemGray6
        login.tintColor = UIColor(named: "DirtyBlue")
        login.layer.borderWidth = 0.5
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.placeholder = "Email or phone"
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        login.delegate = self
        
        
        loginView.addSubview(password)
        password.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        password.topAnchor.constraint(equalTo: self.login.bottomAnchor, constant: .zero),
                                        password.heightAnchor.constraint(equalToConstant: 50),
                                        password.leadingAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                                        password.trailingAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.trailingAnchor, constant: -16)])
        
        password.backgroundColor = .systemGray6
        password.tintColor = UIColor(named: "DirtyBlue")
        password.placeholder = "Password"
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        password.delegate = self
        
        
        mainView.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        loginButton.topAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.topAnchor, constant: 456),
                                        loginButton.heightAnchor.constraint(equalToConstant: 50),
                                        loginButton.leadingAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                                        loginButton.trailingAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.trailingAnchor, constant: -16)])
        
        loginButton.setBackgroundImage(pixelNormal, for: .normal)
        loginButton.setBackgroundImage(pixelSelected, for: .selected)
        loginButton.setBackgroundImage(pixelSelected, for: .highlighted)
        loginButton.setBackgroundImage(pixelSelected, for: .disabled)
        
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "default", size: 16)
        loginButton.addTarget(self, action: #selector(tapButtonProfile), for: .touchUpInside)
    }
    
    
    @objc private func tapButtonProfile() {
        let controller = storyboard?.instantiateViewController(identifier: "ProfileVC")
        navigationController?.pushViewController(controller!, animated: false)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scroll.contentInset.bottom = keyboardSize.height
            scroll.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scroll.contentInset.bottom = .zero
        scroll.verticalScrollIndicatorInsets = .zero
    }
}



extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

