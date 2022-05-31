//
//  LoginViewController.swift
//  AppVK
//
//  Created by N3L1N on 16/02/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 15
        titleLabel.text = "Welcome to VK!"
        loginImageView.backgroundColor = .white
        loginImageView.image = UIImage(named: "vkontakte")
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewWillAppear(animated)
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
//        view.endEditing(true)
    }
    
   
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "loginSeque" else {return false}
            if checkForValidationData() {
                return true
            } else {
                showAlert()
                return false }}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil) }
    

}

private extension LoginViewController {
//    func setupTextFields() {
//        loginTF.keyboardType = .emailAddress
//        passwordTF.keyboardType = .numberPad
//    }
    
    func checkForValidationData() -> Bool {
        guard let loginText = loginTF.text,
              let passwordText = passwordTF.text
        else {
            return false }
        let isValidData = loginText == "" && passwordText == ""
        return isValidData
    }
    
    func showAlert() {
        let alertViewContoller = UIAlertController(title: "Ошибка", message: "Неверное имя или пароль", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.passwordTF.text = ""
            self.loginTF.text = ""
        })
        
        alertViewContoller.addAction(doneButton)
        
        present(alertViewContoller, animated: true, completion: nil)
    }
}
