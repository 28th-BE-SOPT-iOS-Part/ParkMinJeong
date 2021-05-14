//
//  GetPersonDataService.swift
//  Seminar-4th-review
//
//  Created by mindyeoi on 2021/05/14.
//


import Foundation
import Alamofire


struct GetPersonDataService
{
    // 1. 싱글턴 패턴 : static을 이용해서 GetPersonDataService의 싱글턴 인스턴스를 만듦
    // 이렇게 선언해놓으면 여러 뷰컨에서도 shared로 접근하면 같은 인스턴스에 접근할 수 있음
    static let shared = GetPersonDataService()
    
    // 2. @escape를 사용해 escape closure 형태로 completion을 정의함
    // getPersonInfo 함수가 종료되든 말든 상관 없이 completion은 탈출 클로저기 때문에, 전달된다면 이후에 외부에서도 사용이 가능
    // 여기서 <용도>를 <해당 네트워크 작업이 끝날 때 completion 클로저에 네트워크 성공/서버에러/...)와 같은 네트워크 결과를 담아서 호출하게 됨
    // 담은 네트워크 결과는 이후에 ViewController에서 꺼내서 처리
    func getPersonInfo(completion : @escaping (NetworkResult<Any>) -> Void)
    {
        
        // 3. 데이터를 받아오려는 주소를 정의함
        // 필요한 헤더를 Key-Value 형태로 작성
        let URL = "https://mocki.io/v1/e5b82f33-832c-43ae-83c8-c3e053a4ead7"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        // 4.
        let dataRequest = AF.request(URL, // 이 주소로
                                     method: .get, // 'get'을 통해
                                     encoding: JSONEncoding.default, // JSONEncoding 방식으로
                                     headers: header) // header 정보와 함께 (3번에 있는 거)
                            // Request를 보내기 위한 정보를 묶어서 dataRequest에 저장
                            // 이게 데이터를 받기 위한 요청서가 됨!!
        
        
        // 5. 요청서(dataRequest)를 가지고 진짜 서버에 보내서 데이터를 요청함
        dataRequest.responseData { dataResponse in
            // 통신이 완료되면 ~~~~~~~~^dataResponse라는 이름으로 결과가 도착함!
            
            // 6. 도착한 dataResponse의 통신이 성공했는지 실패했는지 여부
            switch dataResponse.result {
            case .success:
                // 6-1. 성공적이라면 우리에게 필요한 정보는 딱 2가지 : statusCode값과 reponse 결과 데이터
                                                
                                                // 6-1-1. response의 statusCode
                                                // 200대 : 클라이언트의 요청을 정상적으로 수행, 400대 : 클라이언트의 요청이 부적절(대부분 우리잘못), 500대 : 서버에 문제 있을 경우(서버분들을 호출,,)
                guard let statusCode = dataResponse.response?.statusCode else {return}
                                                
                guard let value = dataResponse.value else {return}
                
                                                // 6-2. judgeStatus에 이 둘을 실어서 보내버림!
                                                // judgeStatus는 아래 정의되어 있음
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure: completion(.pathErr)
                
            }
        }
                                            
    }
    
    // 아까 받은 statusCode를 바탕으로 어떻게 결괏값을 처리할지 정의함
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
          
        switch statusCode {
        
        case 200: // 성공
            return isValidData(data: data)
        case 400: // 클라이언트의 요청이 잘못됐음
            return .pathErr
        case 500: // 서버 에러
            return .serverErr
        default: return .networkFail
        }
    }
    
    
    //  statusCode가 200대일 때 데이터를 가공하기 위한 함수
    private func isValidData(data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        // JSON 데이터를 해독하기 위해 JSONDecorder을 하나 선언함
        
        guard let decodedData = try? decoder.decode(PersonDataModel.self, from: data)
        else { return .pathErr}
        // 우선 PersonDataModel 형태로 decode(해독)을 한번 거칩니다. 실패하면 pathErr
        
        // 해독에 성공하면 Person data를 success에 넣어줍니다.
        return .success(decodedData.data)

    }
    
}
