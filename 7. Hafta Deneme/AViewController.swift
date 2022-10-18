//
//  AViewController.swift
//  7. Hafta Deneme
//
//  Created by Sümeyye Kılıçoğlu on 23.08.2022.
//

import UIKit

protocol AViewControllerDelegate {
    func saveNote(note: String, title: String)
}



class AViewController: UIViewController {
   
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        
        return button
        
    }()
    
    private let textField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        
       return textField
    }()
        private let textField1 : UITextField = {
        let textField1 = UITextField()
        textField1.placeholder = "Note"
        
       return textField1
    }()
    var delegate: AViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        view.addSubview(textField1)
        view.addSubview(button)
        
        button.bottomToSuperview().constant = -100
        button.leftToSuperview().constant = 50
        button.rightToSuperview().constant = -50
        
        textField.topToSuperview().constant = 200
        textField.leftToSuperview().constant = 20
        textField.rightToSuperview().constant = -20
        
        textField1.bottomToTop(of: textField).constant = 75
        textField1.leftToSuperview().constant = 20
        textField1.rightToSuperview().constant = -20

        
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)

        
    }
    
      @objc func saveTapped() {
          let note = textField1.text
          let title = textField.text
          
          if textField.text == "" {
              makeAlert(titleInput: "Error!", messageInput: "Didn't write title" )
          } else if textField1.text == "" {
              makeAlert(titleInput: "Error!", messageInput: "Didn't write note")
          }
          
          self.delegate?.saveNote(note: note ?? "", title: title ?? "")
          
      }
  func makeAlert(titleInput: String, messageInput: String) {
      let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
      self.present(alert, animated: true, completion: nil)
  }
      
  }

