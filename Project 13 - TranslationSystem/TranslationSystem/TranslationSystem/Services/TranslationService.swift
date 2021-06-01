//
//  TranslationService.swift
//  TranslationSystem
//
//  Created by eunwoo on 2021/05/27.
//

import Foundation
import Alamofire

class TranslationService {
    
    // MARK: - 번역기 서버 통신
    
    func postTranslate(_ source: String, _ target: String, _ text: String, completion: @escaping (NetworkResult<Any>) -> Void) {

        let URL = "https://openapi.naver.com/v1/papago/n2mt"

        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "X-Naver-Client-Id": "mikmnTlfdFwRhqV5zv78",
            "X-Naver-Client-Secret": "ULkIoOsJzn",
        ]

        let body : Parameters = [
            "source" : source,
            "target" : target,
            "text" : text,
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData{
            response in

            switch response.result {

            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200, 201:
                            do{
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(Response.self, from: value)
                                completion(.success(result))
                            } catch {
                                completion(.pathErr)
                            }
                        case 400:
                            print("실패 400")
                            completion(.pathErr)
                        case 401:
                            print("실패 401")
                            completion(.pathErr)
                        case 500:
                            print("실패 500")
                            completion(.serverErr)
                        default:
                            break
                        }
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
    }
}
