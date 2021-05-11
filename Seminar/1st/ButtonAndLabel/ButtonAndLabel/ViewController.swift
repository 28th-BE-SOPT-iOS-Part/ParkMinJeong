//
//  ViewController.swift
//  ButtonAndLabel
//
//  Created by mindyeoi on 2021/05/11.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = "변경 직전의 라벨입니다"
    }

    @IBAction func buttonClicked(_ sender: Any) {
    
        titleLabel.text = "변경 완료!"
        titleLabel.textColor = UIColor.red
    }
    
}


