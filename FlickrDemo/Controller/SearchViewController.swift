//
//  ViewController.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {

    let searchContentStackView: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = NSLayoutConstraint.Axis.vertical
        
        stackView.distribution = UIStackView.Distribution.fillEqually
        
        stackView.spacing = 40
        
        return stackView
    }()
    
    lazy var contentTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "欲搜尋內容"
        
        textField.borderStyle = .roundedRect
        
        textField.clearButtonMode = .always
        
        textField.delegate = self
                
        textField.addTarget(self, action: #selector(textFieldValueChange), for: .editingChanged)
                
        return textField
    }()
    
    lazy var contentCountTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "每頁呈現數量"
        
        textField.borderStyle = .roundedRect
        
        textField.keyboardType = .numberPad
        
        textField.clearButtonMode = .always
        
        textField.delegate = self
                
        textField.addTarget(self, action: #selector(textFieldValueChange), for: .editingChanged)

        return textField
    }()
    
    let searchContentButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("搜尋", for: .normal)
        
        button.setTitleColor(UIColor.white, for: .normal)
        
        button.backgroundColor = UIColor.lightGray
        
        button.addTarget(self, action: #selector(tapSearchButton), for: .touchUpInside)
                
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        navigationItem.title = "搜尋輸入頁"
        
        setupSearchContentStackView()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func setupSearchContentStackView() {
        
        view.addSubview(searchContentStackView)
        
        searchContentStackView.anchor(
            
            centerX: view.centerXAnchor,
            
            centerY: view.centerYAnchor,
            
            width: view.frame.width - (view.frame.width / 10),
            
            height: view.frame.height / 5
            
        )
        
        searchContentStackView.addArrangedSubview(contentTextField)
        
        searchContentStackView.addArrangedSubview(contentCountTextField)
        
        searchContentStackView.addArrangedSubview(searchContentButton)
    }
    
    @objc func textFieldValueChange(sender: UITextField) {
        
        if contentTextField.text != "" && contentCountTextField.text != "" {
            
            searchContentButton.backgroundColor = UIColor.blue
            
            searchContentButton.isEnabled = true
            
        } else {
            
            searchContentButton.backgroundColor = UIColor.lightGray
            
            searchContentButton.isEnabled = false
            
        }
    }
    
    @objc func tapSearchButton(sender: UIButton) {
        
        let contentVC = ContentViewController()
        
        show(contentVC, sender: nil)
    }
}

