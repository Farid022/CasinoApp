//
//  All_Models.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 14/08/2022.
//

import SwiftUI
import Combine
import Foundation
import Network

struct Country_Model: Identifiable, Hashable{
    let id = UUID()
    let contry_title: String
    let contry_image: String
}

//we use this to decode the data to user understandable form
//News API Model
struct NewsAPI_Model_Base: Codable,Hashable {
    static func == (lhs: NewsAPI_Model_Base, rhs: NewsAPI_Model_Base) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    let status: Bool?
    let data2: [NewsAPI_Model_Data]?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case data2 = "data"
        case message
    }
}
struct NewsAPI_Model_Data : Codable, Hashable {
    let newsId: String?
    let newAppId: String?
    let newsTitle, newsDescription, newsLink, newsImage, newsDate, bStatus, newsStatus: String?

    enum CodingKeys: String, CodingKey,Hashable {

        case newsId = "newsId"
        case newAppId = "newAppId"
        
        case newsTitle, newsDescription, newsLink, newsImage, newsDate, bStatus, newsStatus
    }

}


//Category API Model
struct CategoryAPI_Model_Base: Codable,Hashable {
    static func == (lhs: CategoryAPI_Model_Base, rhs: CategoryAPI_Model_Base) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    let status: Bool?
    let welcomeJSON: [CategoryAPI_Model_data]?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case status
        case welcomeJSON = "Json"
        case message
    }
}
struct CategoryAPI_Model_data: Codable,Hashable {
    let catID: String?
    let appURL: String?
    let browserStatus, catName, catImg, catStatus: String?

    enum CodingKeys: String, CodingKey,Hashable {
        case catID = "catId"
        case appURL = "appUrl"
        case browserStatus, catName, catImg, catStatus
    }
}

//Product API Model
struct ProductAPI_Model_Base: Codable, Hashable {
    static func == (lhs: ProductAPI_Model_Base, rhs: ProductAPI_Model_Base) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    let status : Bool?
    let json2 : [ProductAPI_Model_data]?
    let message : String?

    enum CodingKeys: String, CodingKey {
        case status
        case json2 = "Json"
        case message
    }
}
struct ProductAPI_Model_data: Codable,Hashable {
    let pName : String?
    let pDesc : String?
    let purl : String?
    let pimage : String?
    let webview : String?
    let pstatus : String?

    enum CodingKeys: String, CodingKey,Hashable {
        case pName = "PName"
        case pDesc = "PDesc"
        case purl = "Purl"
        case pimage = "Pimage"
        case webview = "Webview"
        case pstatus = "Pstatus"
    }
}


//Bonus API Model
struct Category_bonusAPI_model_Base : Codable, Hashable {
    static func == (lhs: Category_bonusAPI_model_Base, rhs: Category_bonusAPI_model_Base) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    let status : Bool?
    let json3 : [Category_bonusAPI_model_data]?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status
        case json3 = "Json"
        case message
    }
}
struct Category_bonusAPI_model_data : Codable, Hashable {
    let pName : String?
    let pDesc : String?
    let purl : String?
    let pimage : String?
    let webview : String?
    let pstatus : String?

    enum CodingKeys: String, CodingKey, Hashable {
        case pName = "PName"
        case pDesc = "PDesc"
        case purl = "Purl"
        case pimage = "Pimage"
        case webview = "Webview"
        case pstatus = "Pstatus"
    }
}

//About us info API Model
struct AboutusInfo_model_Base : Codable, Hashable {
    static func == (lhs: AboutusInfo_model_Base, rhs: AboutusInfo_model_Base) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    let status : Bool?
    let json4 : [AboutusInfo_model_data]?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status
        case json4 = "Json"
        case message
    }
}
struct AboutusInfo_model_data : Codable, Hashable {
    let termsId: String?
    let termsDecription: String?
    let aboutDescription: String?

    enum CodingKeys: String, CodingKey, Hashable {
        case termsId = "TermsId"
        case termsDecription = "TermsDecription"
        case aboutDescription = "AboutDescription"
    }

}


//BonusInfo_model Model
struct BonusInfo_model_base : Codable, Hashable {
    static func == (lhs: BonusInfo_model_base, rhs: BonusInfo_model_base) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    let status : Bool?
    let json5 : [BonusInfo_model_data]?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case json5 = "Json"
        case message = "message"
    }
}

struct BonusInfo_model_data : Codable, Hashable {
    let bonusId : String?
    let bonusTitle : String?
    let bonusDesc : String?
    let bonusImgGif : String?
    let bonusURL : String?
    let bonusWebView : String?

    enum CodingKeys: String, CodingKey, Hashable {
        case bonusId = "BonusId"
        case bonusTitle = "BonusTitle"
        case bonusDesc = "BonusDesc"
        case bonusImgGif = "BonusImgGif"
        case bonusURL = "BonusURL"
        case bonusWebView = "BonusWebView"
    }

}
