//
//  DetailsViewController.swift
//  GitJob
//
//  Created by IMRAN on 4/4/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let job: Job
    
    init(job: Job) {
        self.job = job
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        guard let jobTitle = self.job.title else {
            title = "Job Details"
            return
        }
        title = jobTitle
    }
    
    
}
