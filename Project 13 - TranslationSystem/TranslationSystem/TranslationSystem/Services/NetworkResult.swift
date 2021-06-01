//
//  NetworkResult.swift
//  TranslationSystem
//
//  Created by eunwoo on 2021/06/01.
//

import Foundation

enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
