//
//  LoginDataModel.swift
//  1st-Assignment
//
//  Created by mindyeoi on 2021/05/14.
//

import Foundation

// MARK: - LoginDataModel
struct LoginDataModel: Codable {
    let success: Bool
    let message: String
    let data: UserData?     // 성공/실패에 다라 data가 있을 수도, 없을 수도 있기 때문에
                            // ?(옵셔널)형으로 data 선언
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    init(from decoder : Decoder) throws // 직접 decode 부분 작성
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(UserData.self, forKey: .data)) ?? nil
    }
}

// MARK: - UserData
struct UserData: Codable {
    let userID: Int
    let userNickname, token: String

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case userNickname = "user_nickname"
        case token
    }
}
