//
//  Util.swift
//  SupportersAnchor
//
//  Created by 최준현 on 12/14/23.
//

import Foundation

func getApiKey(_ path: String)->String{
    guard let apiKey = Bundle.main.object(forInfoDictionaryKey: path) as? String else {return ""}
    return apiKey
}
