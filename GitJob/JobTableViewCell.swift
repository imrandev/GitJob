//
//  JobTableViewCell.swift
//  GitJob
//
//  Created by Fahim Mashroor on 3/4/21.
//

import UIKit

class JobTableViewCell: UITableViewCell {
    
    public static let identifier = "jobcell"
    
    private let viewModel = JobViewModel()
    
    @IBOutlet var jobTitle : UILabel!
    @IBOutlet var company : UILabel!
    @IBOutlet var jobType : UILabel!
    @IBOutlet var companyLogo : UIImageView!
    
    public func bind(job : Job){
        // bind the views with data from viewModel
        self.jobTitle.text = self.viewModel.getJobTitle(job: job)
        self.company.text = self.viewModel.getCompany(job: job)
        self.jobType.text = self.viewModel.getJobType(job: job)
        // download image data from valid url
        // and set the image data into ImageView
        self.viewModel.loadCompanyLogo(job: job, completionHandler: bindCompanyLogo(image:))
    }
    
    private func bindCompanyLogo(image : UIImage){
        self.companyLogo.image = image
    }
}
