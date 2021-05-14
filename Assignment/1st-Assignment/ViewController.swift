//
//  ViewController.swift
//  1st-Assignment
//
//  Created by mindyeoi on 2021/04/09.
//

import UIKit

// https://bestpractiseios.blogspot.com/2018/06/create-textfield-with-underline-ios.html
extension UITextField {
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width-10, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}



class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.setUnderLine()
        pwTextField.setUnderLine()
    }
    
    @IBOutlet weak var alertLabelField: UILabel!
    
    
    // Top Labels
    @IBOutlet weak var StartKakaoTalk: UILabel!
    
    @IBOutlet weak var description1: UILabel!
    @IBOutlet weak var description2: UILabel!
    
    
    // Enter the info
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    @IBAction func Login(_ sender: Any) {
        // text box should not be ""
        if(emailTextField.text != "" && pwTextField.text != "")
        {
            // text box should not be nil
            if let email = emailTextField.text,
               let pw = pwTextField.text
            {
                // To transmit the data to ViewController3
        //       guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ViewController3")
        //               as? ViewController3
        //       else {return}
        //       nextVC.message = emailTextField.text
        //       self.present(nextVC, animated: true)
         //       // present --> navigation이 필요 없는 뷰 컨트롤러의 기본 기능
                
                //---------------------------------------------//
                /* Seminar 4th Assignment */
                self.makeRequestAlert(title: "알림", message: "로그인을 하시겠습니까?", okAction: { _ in self.loginAction()
                    //----------------------------------------------//
                    //

                })
             
                
            }
            else
            {
                alertLabelField.text = "모두 입력해주세요."
            }
        }
        else
        {
            alertLabelField.text = "모두 입력해주세요."
        }
        
    }
    
    func loginAction()
    {
        LoginService.shared.login(email: self.emailTextField.text!, password: self.pwTextField.text!) { result in
            switch result
            {
            case .success(let message):
                
                if let message = message as? String{
                    
                    self.makeAlert(title: "알림", message: message, okAction: { _ in
                        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ViewController3")
                                as? ViewController3
                        else {return}
                                    nextVC.message = self.emailTextField.text
                                    self.present(nextVC, animated: true)}
                 //       // present --> navigation이 필요 없는 뷰 컨트롤러의 기본 기능
                        
                       )
                    
                    
                }
                
            case .requestErr(let message):
                
                if let message = message as? String{
                    
                    self.makeAlert(title: "알림",
                                   message: message)
                }
                
           
            default :
                print("ERROR")
            }
            
            
        }
    }
    
        @IBAction func createAcountButtonClicked(_ sender: Any) {        print("is working")
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ViewController2")
                    as? ViewController2
            else {return}
            self.navigationController?.pushViewController(nextVC, animated:true)
            // push --> navigationController가 꼭 있어야 동작!
        }
        
        
        
        
        
    }

