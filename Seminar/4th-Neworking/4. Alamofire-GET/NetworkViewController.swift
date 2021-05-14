//
//  NetworkViewController.swift
//  Seminar-4th-review
//
//  Created by mindyeoi on 2021/05/14.
//

import UIKit

class NetworkViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getButtonClicked(_ sender: Any) {
        
        GetPersonDataService.shared.getPersonInfo { (response) in
            switch(response)
            {
            case .success(let personData):
                if let data = personData as? Person {
                    
                    self.nameLabel.text = data.name
                    self.messageLabel.text = data.profileMessage
                }
            case .requestErr(let message) :
                print("requestERR",message)
            case .pathErr :
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
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
