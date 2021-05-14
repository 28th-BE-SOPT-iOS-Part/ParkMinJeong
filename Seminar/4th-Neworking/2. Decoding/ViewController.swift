//
//  ViewController.swift
//  Seminar-4th-review
//
//  Created by mindyeoi on 2021/05/14.
//

import UIKit


// 1. 구조체를 만들고 Decodable 채택
struct CoffeeDataModel : Decodable {
    var drink : String
    var price : Int
    var orderer : String
    
}

class ViewController: UIViewController {
    
    // 2. 원랜 서버에서 JSON 데이터를 넘겨주지만
    // 지금은 직접 만들어서 넘겨주자!
    // String에서 """ 를 하면 여러줄의 문자열을 동시에 작성할 수 있음.
    let dummyData = """
        {
          "drink" : "아메리카노",
          "price" : 2000,
          "orderer" : "MinJeong"
        }
    """.data(using: .utf8)!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // 3. JSONDecoder 선언
        let jsonDecoder = JSONDecoder()
        do
        {
            // 4-1. decode를 try
            // 성공하면 order에 저장되고, 에러가 발생하면 catch로 넘어감!
            let order = try jsonDecoder.decode(CoffeeDataModel.self, from: dummyData)
            print("디코더 성공")
            // 4-2. order의 자세한 정보를 출력(dump)
            dump(order)
        }
        catch
        {
            print(error)
        }
    }
}
