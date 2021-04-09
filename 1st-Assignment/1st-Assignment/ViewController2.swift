//
//  ViewController2.swift
//  1st-Assignment
//
//  Created by mindyeoi on 2021/04/09.
//

import UIKit

// https://bestpractiseios.blogspot.com/2018/06/create-textfield-with-underline-ios.html
extension UITextField {
    func setUnderLine2() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width-10, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}


class ViewController2: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.setUnderLine2()
        pwTextField.setUnderLine2()
        pwConfirmTextField.setUnderLine2()
        
    }
    
    @IBOutlet weak var LaunchLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var pwConfirmTextField: UITextField!
    
    @IBOutlet weak var showAlertLabel: UILabel!
    
    @IBAction func CreateAccountButtonClicked(_ sender: Any) {
        
        
        
        
        if (pwTextField.text != pwConfirmTextField.text)
        {
            showAlertLabel.text = "비밀번호가 일치하지 않습니다."
        }
        
        else
        {
            if(emailTextField.text != "" && pwTextField.text != "" && pwConfirmTextField.text != "")
            {
                if let email = emailTextField.text,
                let pw = pwTextField.text
             {
                
                guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ViewController3")
                        as? ViewController3
                else {return}
                // Now, nextVC is SecondViewController instance. (ppt 127p)
                
                // ppt 168p::
                nextVC.message = emailTextField.text
                
                // modal
                self.present(nextVC, animated: true, completion: nil)
                
                // When it works, if you press 'confirm', the page returns to main page.
                self.navigationController?.popViewController(animated: true)
                }
            }
            
            else
            {
                showAlertLabel.text = "모두 입력해주세요. "
            }
        }
            
        
        
        
        

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
