//
//  JobViewModel.swift
//  GitJob
//
//  Created by IMRAN on 5/4/21.
//

import Foundation
import UIKit

class JobViewModel {
    
    private let apiProvider = ApiProvider.getIntance()
    
    func loadJobPositions(completionHandler : @escaping(_ jobs: [Job]) -> ()) {
        apiProvider.fetchJobPositions(completionHandler: completionHandler)
    }
    
    func getJobTitle(job: Job) -> String {
        return job.title!
    }
    
    func getCompany(job: Job) -> String {
        return job.company!
    }
    
    func getJobType(job: Job) -> String {
        return job.type!
    }
    
    func loadCompanyLogo(job: Job, completionHandler: @escaping(_ image: UIImage) -> ()) {
        
        // check if the url is null
        // if null then set a default image data
        // and return
        guard let companyLogo = job.companyLogo else {
            //completionHandler(UIImage(named: "companyLogo")!)
            return
        }
        
        // call the api for image download
        // and pass the callback function for setting the image
        // inside view controlller
        apiProvider.downloadCompanyLogo(imgUrl: companyLogo, completionHandler: completionHandler)
    }
}
