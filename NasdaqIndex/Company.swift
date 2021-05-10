//
//  Company.swift
//  NasdaqIndex
//
//  Created by liurenchi on 5/8/21.
//  
//
//  renchiliu.com
//  https://github.com/RENCHILIU
//  Linkedin: Renchi Liu


import Foundation

// MARK: - Company
struct Company: Codable {
    let symbol, name, lastSale: String?
    let netChange: Double?
    let change: String?
    let marketCap: Int?
    let country: String?
    let ipoYear, volume: Int?
    let sector, industry: String?
    let nasdaqURL: String?

    enum CodingKeys: String, CodingKey {
        case symbol, name
        case lastSale = "last_Sale"
        case netChange = "net_Change"
        case change
        case marketCap = "market_Cap"
        case country
        case ipoYear = "ipo_Year"
        case volume, sector, industry
        case nasdaqURL = "nasdaqUrl"
    }
}
