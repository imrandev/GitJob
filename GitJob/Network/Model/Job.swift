//
//  Jobs.swift
//  GitJob
//
//  Created by Fahim Mashroor on 25/3/21.
//

import Foundation

struct Job : Decodable {

        let company : String?
        let companyLogo : String?
        let companyUrl : String?
        let createdAt : String?
        let descriptionField : String?
        let howToApply : String?
        let id : String?
        let location : String?
        let title : String?
        let type : String?
        let url : String?

        enum CodingKeys: String, CodingKey {
                case company = "company"
                case companyLogo = "company_logo"
                case companyUrl = "company_url"
                case createdAt = "created_at"
                case descriptionField = "description"
                case howToApply = "how_to_apply"
                case id = "id"
                case location = "location"
                case title = "title"
                case type = "type"
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                company = try values.decodeIfPresent(String.self, forKey: .company)
                companyLogo = try values.decodeIfPresent(String.self, forKey: .companyLogo)
                companyUrl = try values.decodeIfPresent(String.self, forKey: .companyUrl)
                createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
                howToApply = try values.decodeIfPresent(String.self, forKey: .howToApply)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                location = try values.decodeIfPresent(String.self, forKey: .location)
                title = try values.decodeIfPresent(String.self, forKey: .title)
                type = try values.decodeIfPresent(String.self, forKey: .type)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
