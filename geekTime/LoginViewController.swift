//
//  LoginViewController.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/7.
//

import UIKit
import SnapKit

protocol ValidatesPhoneNumber{
    func validatePhoneNumber(_ phone:String) -> Bool
}

protocol ValidatesPassword{
    func validatePassword(_ password:String) -> Bool

}

extension ValidatesPhoneNumber{
    func validatePhoneNumber(_ phone:String) -> Bool{
        guard phone.count == 11
        else{
            return false
        }
        return true
    }
}

extension ValidatesPassword{
    func validatePassword(_ password:String) -> Bool{
        if password.count < 6 || password.count > 12{
            return false
        }
        
        return true
    }
}
class LoginViewController: BaseViewController,ValidatesPhoneNumber,ValidatesPassword {
    var phoneTextField: UITextField!
    var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logoView = UIImageView(image: R.image.logo())
        view.addSubview(logoView)
        logoView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        phoneTextField = UITextField()
        phoneTextField.leftView = phoneIconView;
        phoneTextField.leftViewMode = .always
        phoneTextField.placeholder = "请输入手机号码";
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        phoneTextField.layer.borderWidth = 1
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(50)
        }
        
        let pwdIconView = UIImageView(image: R.image.icon_pwd())
        passwordTextField = UITextField()
        passwordTextField.leftView = pwdIconView;
        passwordTextField.leftViewMode = .always
        passwordTextField.placeholder = "请输入密码";
        passwordTextField.textColor = UIColor.hexColor(0x333333)
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneTextField.snp.bottom).offset(15)
            make.left.right.equalTo(phoneTextField)
            make.height.equalTo(50)
        }
        
        let loginBtn = UIButton(type: .custom)
        
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        
//        loginBtn.backgroundColor = UIColor.hexColor(0xf8892e)
        //通过状态设置背景图片，则会有高亮效果
        loginBtn.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.masksToBounds = true
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: UIControl.Event.touchUpInside)
        view.addSubview(loginBtn)

        loginBtn.snp.makeConstraints { make in
            make.left.right.equalTo(passwordTextField)
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.height.equalTo(50)
        }
      
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        // Do any additional setup after loading the view.
    }
    
    @objc func loginBtnClicked(){
        if validatePhoneNumber(phoneTextField.text ?? "") &&
            validatePassword(passwordTextField.text ?? ""){
            print("手机和密码验证通过")
            return
        }
        showToast();
    }
    
    @objc func tapAction(){
        view.endEditing(true)
    }
    
    func showToast(){
        let alertVc = UIAlertController(title: "提示", message: "用户名或者密码错误", preferredStyle: .alert)
        alertVc.addAction(UIAlertAction(title: "确定", style: .cancel))
        
        self.present(alertVc, animated: true)
        ///3秒后自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3, execute: {
            alertVc.dismiss(animated: true)
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
