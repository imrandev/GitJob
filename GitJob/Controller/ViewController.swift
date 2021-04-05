//
//  ViewController.swift
//  GitJob
//
//  Created by Fahim Mashroor on 24/3/21.
//

import UIKit
import Alamofire
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet var tableView : UITableView!
    
    private var jobs : [Job] = []
    
    private var isLoading : Bool = false
    
    private let viewModel = JobViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Job Positions"
        self.isLoading = true;
        onViewSetup()
    }
    
    private func onViewSetup() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.viewModel.loadJobPositions(completionHandler: onJobPositionComplete(_:))
    }
    
    // This a callback function for Job Postions API
    func onJobPositionComplete(_ jobs: [Job]){
        self.jobs = jobs;
        self.tableView.stopSkeletonAnimation()
        self.view.hideSkeleton()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.isLoading {
            self.isLoading = false
        } else {
            onViewSetup()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.isSkeletonable = true
        self.tableView.showSkeleton(usingColor: .blue, transition: .crossDissolve(0.25))
    }
    
    override func viewDidLayoutSubviews() {
        self.tableView.visibleCells.forEach { (tableViewCell) in
            tableViewCell.showSkeleton()
        }
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = DetailsViewController(job: self.jobs[indexPath.row])
        navigationController?.pushViewController(detailsController, animated: true)
    }
}

extension ViewController : SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JobTableViewCell.identifier, for: indexPath) as! JobTableViewCell
        cell.bind(job: self.jobs[indexPath.row])
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return JobTableViewCell.identifier
    }
}

