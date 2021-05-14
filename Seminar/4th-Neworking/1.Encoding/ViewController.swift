//
//  ViewController.swift
//  Seminar-4th-review
//
//  Created by mindyeoi on 2021/05/14.
//

import UIKit

// 1. PersonDataModel 구조체를 선언하고
// Encodable을 채택함
struct PersonDataModel : Encodable
{
    var name : String
    var age : Int
}

class ViewController: UIViewController {
    
    // 2. PersonDataModel 데이터를 선언
    let personData = PersonDataModel(name: "철수", age: 10)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3. JSONEncoder 인스턴스를 선언한 후(swift에선 기본적으로 JSONEncoder을 지원)
        // 예쁘게 출력하게 위해 프로퍼티를 .prettyPrinted로 줌!
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        
        // 에러처리
        do
        {
            let data = try jsonEncoder.encode(personData)
            print(String(data: data, encoding: .utf8)!)
        }
        
        catch
        {
            print(error)
        }
    }


}

