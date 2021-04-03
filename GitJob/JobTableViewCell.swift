//
//  JobTableViewCell.swift
//  GitJob
//
//  Created by Fahim Mashroor on 3/4/21.
//

import UIKit
import Alamofire

class JobTableViewCell: UITableViewCell {
    @IBOutlet var jobTitle : UILabel!
    @IBOutlet var company : UILabel!
    @IBOutlet var jobType : UILabel!
    @IBOutlet var companyLogo : UIImageView!
    
    public func load(job : Job?){
        updateUI(jobTitle: job?.title, imgUrl: job?.companyLogo, company: job?.company, jobType: job?.type)
    }
    
    public func updateUI(jobTitle : String?, imgUrl: String?, company: String?, jobType: String?){
        self.jobTitle.text = jobTitle
        self.company.text = company
        self.jobType.text = jobType
        guard let url = imgUrl else {
            self.companyLogo.image = UIImage(named: "companyLogo")
            return
        }
        loadCompanyLogo(url: url)
    }
    
    private func loadCompanyLogo(url : String){
        AF.request(url).responseData {(response) in
            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
                self.companyLogo.image = UIImage(data: image)
                }
        }
    }
}
