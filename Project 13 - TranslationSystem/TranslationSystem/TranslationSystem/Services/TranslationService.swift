//
//  TranslationService.swift
//  TranslationSystem
//
//  Created by eunwoo on 2021/05/27.
//

import Foundation
import Alamofire

class TranslationService {
    // Post https://openapi.naver.com/v1/papago/n2mt
    
    // MARK: - 서버 통신
    
//    func createComment(_ postId: Int, _ content: String, completion: @escaping (NetworkResult<Any>) -> Void) {
//
//        let URL = APIConstants.Post + "/" + String(postId) + "/comment"
//
//        var token = "Bearer "
//        token += KeychainWrapper.standard.string(forKey: "token") ?? ""
//
//        let headers: HTTPHeaders = [
//            "Content-Type" : "application/json;charset=UTF-8",
//            "Accept": "application/hal+json",
//            "Authorization": token
//        ]
//
//        let body : Parameters = [
//            "content" : content
//        ]
//
//        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData{
//            response in
//
//            switch response.result {
//
//            case .success:
//                if let value = response.result.value {
//                    if let status = response.response?.statusCode {
//                        switch status {
//                        case 200, 201:
//                            do{
//                                let decoder = JSONDecoder()
//                                let result = try decoder.decode(Comment.self, from: value)
//                                completion(.success(result))
//                            } catch {
//                                completion(.pathErr)
//                            }
//                        case 400:
//                            do{
//                                let decoder = JSONDecoder()
//                                let result = try decoder.decode(Response.self, from: value)
//                                completion(.requestErr(result.message))
//                            } catch {
//                                completion(.pathErr)
//                            }
//                        case 401:
//                            print("실패 401")
//                            completion(.pathErr)
//                        case 500:
//                            print("실패 500")
//                            completion(.serverErr)
//                        default:
//                            break
//                        }
//                    }
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//                completion(.networkFail)
//            }
//        }
//    }
}
