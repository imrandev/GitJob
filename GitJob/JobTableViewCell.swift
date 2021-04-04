//
//  JobTableViewCell.swift
//  GitJob
//
//  Created by Fahim Mashroor on 3/4/21.
//

import UIKit

class JobTableViewCell: UITableViewCell {
    
    public static let identifier = "jobcell"
    
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
        
        // check if the url is null
        // if null then set a default image data
        // and return
        guard let url = imgUrl else {
            self.companyLogo.image = UIImage(named: "companyLogo")
            return
        }
        
        // download image data from valid url
        // and set the image data into ImageView
        ApiProvider.getIntance().downloadCompanyLogo(imgUrl: url, completionHandler: loadCompanyLogo(image:))
    }
    
    private func loadCompanyLogo(image : UIImage){
        self.companyLogo.image = image
    }
}
