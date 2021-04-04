//
//  ApiProvider.swift
//  GitJob
//
//  Created by IMRAN on 3/4/21.
//

import Foundation
import Alamofire
import UIKit

class ApiProvider {
    
    private static var instance : ApiProvider!
    
    public static func getIntance() -> ApiProvider {
        if instance == nil {
            instance = ApiProvider()
        }
        return instance;
    }
    
    func fetchJobPositions(completionHandler: @escaping(_ jobs: [Job]) -> ()) {
        var jobList = [Job]()
        let request = AF.request(Constant.BASE_URL + Constant.JOB_POSITIONS)
        request.responseDecodable(of: [Job].self){
            (response) in
            jobList = response.value!
            print(response.value![0].title!)
            completionHandler(jobList)
        }
    }
    
    func downloadCompanyLogo(imgUrl : String, completionHandler: @escaping(_ image: UIImage) -> ()) {
        AF.request(imgUrl).responseData {(response) in
            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
                completionHandler(UIImage(data: image)!)
            }
        }
    }
}
