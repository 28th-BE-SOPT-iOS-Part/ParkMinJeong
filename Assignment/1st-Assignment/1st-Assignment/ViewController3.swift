//
//  ViewController3.swift
//  1st-Assignment
//
//  Created by mindyeoi on 2021/04/09.
//

import UIKit

class ViewController3: UIViewController {

    
    @IBOutlet weak var messageLabel: UILabel!
    var message : String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        
    }
    
    func setLabel()
    {
        if let msg = self.message
        {
            messageLabel.text = "\(msg) 님"
        }
    }
    
    
    @IBAction func ConfrimButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

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
